<?php

$idVeiculo = $_GET['idVeiculo'];
$datainicio = $_GET['datainicio'];

header("Location: view/requisicoes/vw_mapUtilizacaoVeiculo.php?idVeiculo=$idVeiculo&datainicio=$datainicio");

?>
