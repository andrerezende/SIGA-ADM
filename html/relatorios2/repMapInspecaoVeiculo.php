<?php

$idVeiculo = $_GET['idVeiculo'];
$idMotorista = $_GET['idMotorista'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];

header("Location: view/requisicoes/vw_mapReqInspecaoVeiculo.php?idVeiculo=$idVeiculo&idMotorista=$idMotorista&datainicio=$datainicio&datafim=$datafim");

?>
