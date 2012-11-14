<?php
ini_set('memory_limit','300M');     // memory limit 
ini_set('max_execution_time','1200');    // tempo maximo de espera 20 min
ini_set('display_errors', 1);

require_once 'ImpressaoMPDF.php';

$html = file_get_contents($_GET['input_file']);

// MPDF
$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL.'/relatorios2/PRINT_PDF/css/estilo.css';

$header = "MINISTÉRIO DA EDUCAÇÃO - SECRETARIA DE EDUCAÇÃO PROFISSIONAL E TECNOLÓGICA - INSTITUTO FEDERAL BAIANO";

$pdf = new ImpressaoMPDF($html, "IF BAIANO", $css, null, $header);

$pdf->setArchiveName(rawurlencode(pathinfo(basename(__FILE__), PATHINFO_FILENAME)));
$pdf->gerarPDF("DEFAULT");