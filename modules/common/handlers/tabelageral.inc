<?
    $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main'; 
    $navbar->AddOption('Tabelageral', 'common', "main:mad:tabelageral:$action");
    $MIOLO->InvokeHandler($module, "tabelageral/$action");


   /* $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main'; 
    $navbar->AddOption('Tabelageral', 'common', "main:mad:tabelageral:$action");
    $MIOLO->InvokeHandler($module, "tabelageral/$action");
*/
?>