<?
    $perms->CheckAccess('setor',A_ACCESS,true);
    $action = $context->ShiftAction();
    if ($action == NULL) $action = ($item != NULL) ? 'main' : 'find'; 
    $navbar->AddOption('Setores', 'common', "main:mad:setor");
    $MIOLO->InvokeHandler($module, "setor/$action");
?>
