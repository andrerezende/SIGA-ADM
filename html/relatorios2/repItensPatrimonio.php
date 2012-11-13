<?php

$filtradoPor = $_GET['filtradoPor'];
$idSetor = $_GET['idSetor'];
$idInstituicao = $_GET['idInstituicao'];
$idVidaUtil = $_GET['idVidaUtil'];
$numeroEmpenho = $_GET['numeroEmpenho'];
$cnpj = $_GET['cnpj'];
$orderBy = $_GET['orderby'];
$siglaSetor = $_GET['siglasetor'];
//var_dump($idInstituicao);exit;
header("Location: view/itemPatrimonio/vw_itemPatrimonio.php?filtradoPor=$filtradoPor&idSetor=$idSetor&idInstituicao=$idInstituicao&idVidaUtil=$idVidaUtil&numeroEmpenho=$numeroEmpenho&cnpj=$cnpj&orderby=$orderBy&siglasetor=$siglaSetor"); 
