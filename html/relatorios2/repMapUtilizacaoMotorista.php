<?php

$idMotorista = $_GET['idMotorista'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$iduo = $_GET['iduo'];

if($iduo)
    header("Location: view/requisicoes/vw_mapUtilizacaoMotoristaUo.php?idMotorista=$idMotorista&datainicio=$datainicio&datafim=$datafim&iduo=$iduo");
else
    header("Location: view/requisicoes/vw_mapUtilizacaoMotorista.php?idMotorista=$idMotorista&datainicio=$datainicio&datafim=$datafim");

?>
