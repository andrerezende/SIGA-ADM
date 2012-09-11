<?php
include '../classes/security/mlogin.class';
session_id($_REQUEST['sid']);
session_start();
$login = $_SESSION['login'];
echo $login->id ? 'ok':'not ok';
?>