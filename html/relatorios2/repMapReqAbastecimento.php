<?php

$idVeiculo = $_GET['idVeiculo'];
$datainicio = $_GET['datainicio'];

header("Location: view/requisicoes/vw_mapReqAbastecimento.php?idVeiculo=$idVeiculo&datainicio=$datainicio");

?>
