<?
    $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main'; 
    $navbar->AddOption('Sistemas', 'common', "main:sistema:$action");
    $MIOLO->InvokeHandler($module, "sistema/$action");
?>