<?
    $perms->CheckAccess('EditarObra',A_ACCESS,true);
    $action = $context->ShiftAction();
    if ($action == NULL) $action = ($item != NULL) ? 'main' : 'find'; 
    $navbar->AddOption('EditarObra', 'common', "main:mad:editarobra");
    $MIOLO->InvokeHandler($module, "editarobra/$action");
?>
