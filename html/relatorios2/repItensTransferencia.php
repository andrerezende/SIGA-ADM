<?php

$tombo=$_GET['tombo'];
$setorOrigem=$_GET['setororigem'];
$setorDestino=$_GET['setordestino'];

$datainicio=$_GET['datainicio'];
$datafim=$_GET['datafim'];

$instOrigem = $_GET['instOrigem'];
$instDestino = $_GET['instDestino'];

header("Location: view/itemPatrimonio/vw_repItensTransferencia.php?tombo=$tombo&setororigem=$setorOrigem&setordestino=$setorDestino&datainicio=$datainicio&datafim=$datafim&instOrigem=$instOrigem&instDestino=$instDestino");

?>
