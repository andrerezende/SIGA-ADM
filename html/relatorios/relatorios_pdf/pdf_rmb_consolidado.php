<?php
require_once '../classes/dompdf/dompdf_config.inc.php';

$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . '/relatorios/statics/';
$baseURL_pdf = 'http://' . $_SERVER['HTTP_HOST'] . '/relatorios/relatorios_pdf/';

$domPdf = new DOMPDF();

$html = file_get_contents($_GET['input_file']);

$html = str_replace($baseURL, $baseURL_pdf, $html);

$html = str_replace('logo_ifbaiano.jpg"', 'logo_ifbaiano.jpg" width="250"', $html);

$domPdf->load_html($html);

$domPdf->render();

$domPdf->stream(pathinfo(__FILE__, PATHINFO_FILENAME) . '.pdf');
