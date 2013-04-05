<?php

$idRequisicao = $_GET['idRequisicao'];
$status = $_GET['status'];

header("Location: view/requisicoes/vw_mapRelatorioReq.php?idRequisicao=$idRequisicao&status=$status");

?>