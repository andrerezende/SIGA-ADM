<?
    $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main'; 
    $navbar->AddOption('Uf', 'common', "main:uf:$action");
    $MIOLO->InvokeHandler($module, "uf/$action");
?>