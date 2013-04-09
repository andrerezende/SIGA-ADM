<?php

$idVeiculo = $_GET['idVeiculo'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];

header("Location: view/requisicoes/vw_mapReqAbastecimento.php?idVeiculo=$idVeiculo&datainicio=$datainicio&datafim=$datafim");

?>
