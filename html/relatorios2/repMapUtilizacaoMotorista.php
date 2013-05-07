<?php

$idMotorista = $_GET['idMotorista'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];

header("Location: view/requisicoes/vw_mapUtilizacaoMotorista.php?idMotorista=$idMotorista&datainicio=$datainicio&datafim=$datafim");

?>
