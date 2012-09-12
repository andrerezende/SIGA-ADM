<?php
// Debug
ini_set('display_errors', 1);

// Data/hora
date_default_timezone_set('America/Bahia');

/**
 * Função para exibir o debug.
 *
 * @param string $var
 * @param boolean $showHtml
 * @param boolean $showFrom
 */
function debug($var = false, $showHtml = false, $showFrom = true) {
	echo '<div class="debug">';
	if ($showFrom) {
		$calledFrom = debug_backtrace();
		echo '<strong>' . substr(str_replace(ROOT, '', $calledFrom[0]['file']), 1) . '</strong>';
		echo ' (line <strong>' . $calledFrom[0]['line'] . '</strong>)';
	}
	echo "\n<pre class=\"cake-debug\">\n";
	$var = print_r($var, true);
	if ($showHtml) {
		$var = str_replace('<', '&lt;', str_replace('>', '&gt;', $var));
	}
	echo $var . "\n</pre>\n";
	echo '</div>';
}