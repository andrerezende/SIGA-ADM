<?php

$idMotorista = $_GET['idMotorista'];
$datainicio = $_GET['datainicio'];

header("Location: view/requisicoes/vw_mapUtilizacaoMotorista.php?idMotorista=$idMotorista&datainicio=$datainicio");

?>
