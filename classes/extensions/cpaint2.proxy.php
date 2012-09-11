<?php
/**
 * CPAINT (Cross-Platform Asynchronous INterface Toolkit)
 *
 * http://sf.net/projects/cpaint
 *
 * released under the terms of the GPL
 * see http://www.fsf.org/licensing/licenses/gpl.txt for details
 *
 *
 * proxy script to pass request on to remote servers
 *
 * @package    CPAINT
 * @author     Paul Sullivan <wiley14@gmail.com>
 * @author     Dominique Stender <dstender@st-webdevelopment.de>
 * @copyright  Copyright (c) 2005-2006 Paul Sullivan, Dominique Stender - http://sf.net/projects/cpaint
 * @version 	  $Id: cpaint2.proxy.php 317 2006-09-30 08:42:04Z saloon12yrd $
 */

//---- includes ----------------------------------------------------------------
/**
 *	include configuration file
 */
require_once(dirname(__FILE__) . '/cpaint2.config.php');

//---- functions ---------------------------------------------------------------

/**
 * Similar to PHP's builtin parse_url() function, but makes sure what the schema,
 * path and port keys are set to http, /, 80 respectively if they're missing
 *
 * @access     public
 * @param      string    $raw_url    Raw URL to be split into an array
 * @return     array
 */
function parse_url_clean($raw_url) {
	$retval   = array();
	$raw_url  = (string) $raw_url;

	// make sure parse_url() recognizes the URL correctly.
	if (strpos($raw_url, '://') === false) {
		$raw_url = 'http://' . $raw_url;
	} // end: if

	// split request into array
	$retval = parse_url($raw_url);

	// make sure a path key exists
	if (!isset($retval['path'])) {
		$retval['path'] = '/';
	} // end: if

	// set port to 80 if none exists
	if (!isset($retval['port'])) {
		$retval['port'] = '80';
	} // end: if

	return $retval;
}

/**
 * Performs a check of the URL to be requested against the whitelist.
 *
 * Returns true if the URL in question if allowed, false otherwise.
 * Expects an array generated by PHP's parse_url() function as input parameter.
 *
 * @access     public
 * @param      array   $request_parts    The URL in question.
 * @return     boolean
 */
function whitelist_check($request_parts) {
	global $cpaint2_proxy_whitelist;
	$retval           = false;
	$request_check    = '';
	$whitelist_url    = '';
	$whitelist_parts  = array();
	$whitelist_check  = '';

	// iterate over all URLs within the whitelist
	foreach($cpaint2_proxy_whitelist as $whitelist_url) {

		$whitelist_parts = parse_url_clean($whitelist_url);

		if (array_key_exists('path', $whitelist_parts)) {
			// perform a check of host and path if path is part of the whitelist entry
			$whitelist_check = $whitelist_parts['host'] . $whitelist_parts['path'];
			$request_check   = $request_parts['host'] . $request_parts['path'];

		} else {
			// compare only the hosts, path is not part of the whitelist entry
			$whitelist_check = $whitelist_parts['host'];
			$request_check   = $request_parts['host'];
		} // end: if

		// check if whitelist check string marks the beginning of the request check string
		if (strpos($request_check, $whitelist_check) === 0) {
			$retval = true;
			break;
		} // end: if
	} // end: foreach

	return $retval;
}

//---- variables ---------------------------------------------------------------
$http_response      = '';
$request_allowed    = false;
$cp_socket          = false;
$stream_timeout_s   = floor($cpaint2_config['proxy']['stream_timeout'] / 1000);
$stream_timeout_ms  = $cpaint2_config['proxy']['stream_timeout'] - $stream_timeout_s * 1000;
$stream_meta        = array();

$cp_remote_url      = '';
$cp_remote_method   = '';
$cp_remote_query    = '';

$cp_response_type   = '';

$cp_request_body    = '';
$cp_request_header  = '';
$url_parts          = array();

//---- main code ---------------------------------------------------------------
// alter PHP's error reporting setting if set
if ($cpaint2_config['proxy']['security']['error_reporting'] != '') {
	error_reporting($cpaint2_config['proxy']['security']['error_reporting']);
} // end: if

// alter maximum runtime according to configuration
if ($cpaint2_config['proxy']['time_limit'] != -1) {
	set_time_limit($cpaint2_config['proxy']['time_limit']);
} // end: if

// determine which method to use (fsockopen or CURL)
$curl_exists = function_exists('curl_init');
$fsock_exists = function_exists('fsockopen');

// check to see if use_curl option is set and within range
// if not, default to 0 (use fsockopen)
if ((!isset($cpaint2_config['proxy']['use_curl']))
|| ($cpaint2_config['proxy']['use_curl'] < 0)
|| ($cpaint2_config['proxy']['use_curl'] > 3)) {
	$cpaint2_config['proxy']['use_curl'] = 0;
}

if ((!$fsock_exists && $cpaint2_config['proxy']['use_curl'] == 0)
|| (!$curl_exists && $cpaint2_config['proxy']['use_curl'] == 1)) {
	die('[CPAINT] No method available for connecting to remote server');
}

if ($cpaint2_config['proxy']['use_curl'] == 0) $use_fsock = true;
if ($cpaint2_config['proxy']['use_curl'] == 1) $use_fsock = false;
if ($cpaint2_config['proxy']['use_curl'] == 2) $use_fsock = $fsock_exists;
if ($cpaint2_config['proxy']['use_curl'] == 3) $use_fsock = $curl_exists;

if ($_REQUEST['cpaint_remote_url'] != '') {
	$cp_remote_url      = urldecode($_REQUEST['cpaint_remote_url']);
	$cp_remote_method   = urldecode($_REQUEST['cpaint_remote_method']);
	$cp_remote_query    = urldecode($_REQUEST['cpaint_remote_query']);
	$cp_response_type   = strtoupper($_REQUEST['cpaint_response_type']);
} // end: if

// propagate XML header if necessary
if ($cp_response_type == 'XML'
|| $cp_response_type == 'OBJECT') {

	header('Content-type:  text/xml');
} // end: if

// start build HTTP headers
if ($cp_remote_method == 'GET') {
	$cp_remote_url    .= '?' . $cp_remote_query;

	// prepare parameters
	$url_parts  = parse_url_clean($cp_remote_url);

	if ($use_fsock) {
		// build basic header
		$cp_request_header  = 'GET ' . $url_parts['path'] . '?'
		. str_replace(' ', '+', $url_parts['query'])
		. " HTTP/1.0\r\n"
		. 'Host: ' . $url_parts['host'] . "\r\n";

	} else {
		$curl['url'] 				= $url_parts['path'] . '?' . str_replace(' ', '+', $url_parts['query']);
		$curl['header'][]		= 'Host: ' . $url_parts['host'] . "\r\n";
	}
} elseif ($cp_remote_method == 'POST') {
	$cp_request_body  = '&' . $cp_remote_query;

	// prepare parameters
	$url_parts  = parse_url_clean($cp_remote_url);

	if ($use_fsock) {
		// build basic header
		$cp_request_header  = 'POST ' . $url_parts['path']  . " HTTP/1.0\r\n"
		. 'Host: ' . $url_parts['host'] . "\r\n"
		. "Content-Type:  application/x-www-form-urlencoded\r\n";
	} else {
		$curl['url'] 				= $url_parts['path'];
		$curl['header'][]		= 'Host: ' . $url_parts['host'] . "\r\n";
	}
} // end: if

$content_length_header = 'Content-Length: ' . strlen($cp_request_body) . "\r\n";
if ($use_fsock) {
	// add content-length header
	$cp_request_header .= $content_length_header;
} else {
	$curl['header'][] 	= $content_length_header;
}

// add authentication to header if necessary
if (isset($url_parts['user'])
&& $url_parts['user'] != '') {

	if ($use_fsock) {
		$cp_request_header .= 'Authorization: Basic '
		. base64_encode($url_parts['user'] . ':' . $url_parts['pass']) . "\r\n";
	} else {
		$curl['userauth']			= $url_parts['user'] . ':' . $url_parts['pass'];
	}

} // end: if

// perform a check against the whitelist if necessary
if ($cpaint2_config['proxy']['security']['use_whitelist'] == true) {
	$request_allowed = whitelist_check($url_parts);

} else {
	// whitelist is disabled, allow any request
	$request_allowed = true;
} // end: if

if ($request_allowed == true) {

	if ($use_fsock) {
		// open connection
		$cp_socket = @fsockopen($url_parts['host'], $url_parts['port'], $error, $errstr, $cpaint2_config['proxy']['connect_timeout']);

		if ($cp_socket !== false) {
			// send headers
			@fwrite($cp_socket, $cp_request_header . "\r\n\r\n");

			// send body if necessary
			if ($cp_request_body != '') {
				@fwrite($cp_socket, $cp_request_body . "\r\n");
			} // end: if

			// set stream timeout
			if ($cpaint2_config['proxy']['stream_timeout'] > -1) {
				stream_set_timeout($cp_socket, $stream_timeout_s, $stream_timeout_ms);
			} // end: if

			while (!feof($cp_socket)) {
				$http_response .= fgets($cp_socket);
			} // end: while

			// check whether the request has timed out.
			$stream_meta = stream_get_meta_data($cp_socket);

			if ($stream_meta['timed_out'] == false) {
				list($http_headers, $http_body) = split("\r\n\r\n", $http_response, 2);
				echo($http_body);

			} else {
				die('[CPAINT] The request ran into a timeout.');
			} // end: if

			@fclose($cp_socket);
		} // end: if

	} else {
		// use curl
		$curl_session = curl_init();
		curl_setopt($curl_session, CURLOPT_URL, $curl['url']);
		curl_setopt($curl_session, CURLOPT_HEADER, false);
		curl_setopt($curl_session, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
		curl_setopt($curl_session, CURLOPT_FORBID_REUSE, true);

		if (isset($curl['header'])) {
			curl_setopt($curl_session, CURLOPT_HTTPHEADER, $curl['header']);
		} // end: if

		if (isset($curl['userauth'])) {
			curl_setopt($curl_session, CURLOPT_USERPWD, $curl['userauth']);
			curl_setopt($curl_session, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
		} // end: if
		if ($cp_remote_method == 'GET') {
			curl_setopt($curl_session, CURLOPT_GET, true);
		} // end: if

		if ($cp_remote_method == 'POST') {
			curl_setopt($curl_session, CURLOPT_GET, false);
			curl_setopt($curl_session, CURLOPT_POST, true);
			curl_setopt($curl_session, CURLOPT_POSTFIELDS, $cp_request_body);
		} // end: if

		if ($cpaint2_config['proxy']['connect_timeout'] > -1) {
			curl_setopt($curl_session, CURLOPT_CONNECTTIMEOUT, $cpaint2_config['proxy']['connect_timeout']);
		}  // end: if

		if ($cpaint2_config['proxy']['stream_timeout'] > -1) {
			curl_setopt($curl_session, CURLOPT_TIMEOUT, $stream_timeout_s);
		}  // end: if

		curl_exec($curl_session);

		if (curl_errno($curl_session) != 0) {
			die('[CPAINT] CURL experienced the error "' . curl_error($curl_session) . '"');
		}  // end: if

		curl_close($curl_session);

	}

} else {
	die('[CPAINT] The host or script cannot be accessed through this proxy.');
} // end: if

?>