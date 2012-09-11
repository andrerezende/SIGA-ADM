<?
    $perms->CheckAccess('planodep',A_ACCESS,true);
    $action = $context->ShiftAction();
    if ($action == NULL) $action = ($item != NULL) ? 'main' : 'find'; 
    $navbar->AddOption('Instituições', 'common', "main:mad:instituicao");
    $MIOLO->InvokeHandler($module, "instituicao/$action");
?>
