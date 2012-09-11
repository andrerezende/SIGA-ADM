<?php
#ini_set("error_report", "E_ALL & ~E_NOTICE");

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Support for gettext()
#---------------------------------------------------------------------
if (function_exists('_'))
{
	$TEXTDOMAIN = 'miolo';

	setlocale(LC_ALL, $MIOLOCONF['i18n']['language']);
	bindtextdomain($TEXTDOMAIN, $MIOLOCONF['i18n']['locale']);
	textdomain($TEXTDOMAIN);
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# This function is a wrapper for the gettext support. In addition to
# the standard gettext() function, it provides support for up to three
# positional parameters represented by the placeholders <code>@1</code>,
# <code>@2</code> and <code>@3</code>.
#
# @example
# echo _M('@1 is a romance written by @2 in @3','foo','Tom Sawyer','Mark Twain','1890');
# // will result in:
# //   "Tom Sawyer is a romance written by Mark Twain in 1890"
#
# echo _M('@2 escreveu o romance @1 em @3','foo','Tom Sawyer','Mark Twain','1890');
# //
# // will result in:
# //   "Mark Twain escreveu o romance Tom Sawyer em 1890"
#---------------------------------------------------------------------
function _M($msg, $dom = 'miolo', $p1 = null, $p2 = null, $p3 = null)
{
	global $TEXTDOMAIN, $MIOLOCONF;

	if ($msg == '')
	{
		return $msg;
	}

	if (function_exists('_'))
	{
		if ($dom != $TEXTDOMAIN)
		{
			$TEXTDOMAIN = $dom;
			bindtextdomain($TEXTDOMAIN, $MIOLOCONF['i18n']['locale']);
			textdomain($TEXTDOMAIN);
		}

		$msg = _($msg);
	}

	if ($p1 !== null)
	{
		$msg = str_replace('@1', $p1, $msg);
	}

	if ($p2 !== null)
	{
		$msg = str_replace('@2', $p2, $msg);
	}

	if ($p3 !== null)
	{
		$msg = str_replace('@3', $p3, $msg);
	}

	return $msg;
}

function __autoload($className)
{
	global $autoload;

	//echo "<br>autoload: $className<br>";
	if (defined('DOMPDF_DIR'))
	{
		$fileName = DOMPDF_autoload($className);
		if (file_exists($fileName))
		$autoload->setFile($className, $fileName);
	}
	$className = strtolower($className);
	if ( ($file = $autoload->getFile($className)) != '' )
	{
		include_once($file);
	}
}
?>