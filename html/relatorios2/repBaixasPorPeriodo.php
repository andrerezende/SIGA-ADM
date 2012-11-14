<?php

$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$instituicoes=$_GET['instituicoes'];
$inst=$_GET['inst'];

header("Location: view/itemPatrimonio/vw_repBaixasPorPeriodo.php?datainicio=$datainicio&datafim=$datafim&instituicoes=$instituicoes&inst=$inst");

?>
