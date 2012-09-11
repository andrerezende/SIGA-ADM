<?php
$idUoAlmoxerifado = $_GET['idUoAlmoxerifado'];
$mes = $_GET['mes'];
$ano = $_GET['ano'];
$notaFiscal = $_GET['notaFiscal'];
$filtradoPor = $_GET['filtradoPor'];
$tipo = $_GET['tipo'];
$uo = $_GET['uo'];

header("Location: view/almoxerifado/vw_rma.php?tipo=$tipo&filtradoPor=$filtradoPor&idUoAlmoxerifado=$idUoAlmoxerifado&mes=$mes&ano=$ano&uo=$uo&notaFiscal=$notaFiscal");