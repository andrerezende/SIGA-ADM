<?php

//$idVeiculo = $_GET['idVeiculo'];
//$idMotorista = $_GET['idMotorista'];
$idSituacaoInspecao = $_GET['idSituacaoInspecao'];
$idInspecao = $_GET['idInspecao'];
$conformidade = $_GET['conformidade'];
$iduo = $_GET['iduo'];
if($iduo)
    header("Location: view/requisicoes/vw_mapReqInspecaoVeiculoUo.php?idInspecao=$idInspecao&idSituacaoInspecao=$idSituacaoInspecao&conformidade=$conformidade&iduo=$iduo");
else
    header("Location: view/requisicoes/vw_mapReqInspecaoVeiculo.php?idInspecao=$idInspecao&idSituacaoInspecao=$idSituacaoInspecao&conformidade=$conformidade");

?>
