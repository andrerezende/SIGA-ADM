<?php

$notafiscal = $_GET['notafiscal'];
$descricao = $_GET['descricao'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$ativo=$_GET['ativo'];

header("Location: view/itemPatrimonio/vw_repItensEstornados.php?notafiscal=$notafiscal&descricao=$descricao&datainicio=$datainicio&datafim=$datafim&ativo=$ativo");

?>
