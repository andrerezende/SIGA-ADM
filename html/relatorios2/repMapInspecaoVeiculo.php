<?php

//$idVeiculo = $_GET['idVeiculo'];
//$idMotorista = $_GET['idMotorista'];
$idSituacaoInspecao = $_GET['idSituacaoInspecao'];
$idInspecao = $_GET['idInspecao'];
$conformidade = $_GET['conformidade'];

header("Location: view/requisicoes/vw_mapReqInspecaoVeiculo.php?idInspecao=$idInspecao&idSituacaoInspecao=$idSituacaoInspecao&conformidade=$conformidade");

?>
