<?php

$idRequisicao = $_GET['idRequisicao'];
$status = $_GET['status'];

header("Location: view/requisicoes/vw_mapRequisicao.php?idRequisicao=$idRequisicao&status=$status");

?>