<?php

$idUo=$_GET['idUo'];
$idNotaFiscal=$_GET['idNotaFiscal'];
$idContaContabil=$_GET['idContaContabil'];

$datainicio=$_GET['datainicio'];
$datafim=$_GET['datafim'];

header("Location: view/itemPatrimonio/vw_relatorioNotafiscal.php?idUo=$idUo&idNotaFiscal=$idNotaFiscal&idContaContabil=$idContaContabil&datainicio=$datainicio&datafim=$datafim");

?>
