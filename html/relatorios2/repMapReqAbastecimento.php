<?php

$idVeiculo = $_GET['idVeiculo'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$iduo = $_GET['iduo'];
if($iduo)
    header("Location: view/requisicoes/vw_mapReqAbastecimentoUo.php?idVeiculo=$idVeiculo&datainicio=$datainicio&datafim=$datafim&iduo=$iduo");
else
  header("Location: view/requisicoes/vw_mapReqAbastecimento.php?idVeiculo=$idVeiculo&datainicio=$datainicio&datafim=$datafim");

?>
