<?php

$MIOLO->trace( 'file:' . $_SERVER['SCRIPT_NAME'] );

if ( ! $module )
{
    $module = 'admin';
}

if ( ( ( $a = $context->ShiftAction() ) == NULL ) && ( $module != 'admin') )
{
    $a = 'main';
}

//$MIOLO->checkAccess( $MIOLO->getConf('login.module'), A_ACCESS,true);

$handled = $MIOLO->InvokeHandler($module, $a);
include_once( $MIOLO->getConf('home.modules') . '/main_menu.inc' );

?>