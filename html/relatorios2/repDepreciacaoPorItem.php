<?php

$mesRelatorio = $_GET['mesRelatorio'];
$idInstituicao = $_GET['idInstituicao'];
$instituicao = $_GET['instituicao'];
$idVidaUtil = $_GET['idVidaUtil'];
$contacontabil= $_GET['contacontabil'];
$situacao= $_GET['situacao'];

header("Location: view/itemPatrimonio/vw_depreciacaoPorItem.php?mesRelatorio=$mesRelatorio&idInstituicao=$idInstituicao&instituicao=$instituicao&idVidaUtil=$idVidaUtil&contacontabil=$contacontabil&situacao=$situacao"); 

?>
