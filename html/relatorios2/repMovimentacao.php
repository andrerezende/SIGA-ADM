<?php
//print_r($_GET);exit;

$filtradoPor = $_GET['filtradoPor'];
$idNotaFiscal = $_GET['idNotaFiscal'];
$notaFiscal = $_GET['notaFiscal'];
$descricaoSubElemento = $_GET['descricaoSubElemento'];
$idSubElemento = $_GET['idSubElemento'];
$siglaUo = $_GET['siglaUo'];
$idUo = $_GET['idUo'];
$dataInicio = $_GET['dataInicio'];
$dataFim = $_GET['dataFim'];

header("Location: view/movimentacao/vw_movimentacao.php?filtradoPor=$filtradoPor&idNotaFiscal=$idNotaFiscal&notaFiscal=$notaFiscal&descricaoSubElemento=$descricaoSubElemento&idSubElemento=$idSubElemento&siglaUo=$siglaUo&idUo=$idUo&dataInicio=$dataInicio&dataFim=$dataFim"); 
