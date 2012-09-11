<?
    $action = $context->ShiftAction();
    if ($action == NULL) $action = ($item != NULL) ? 'main' : 'find'; 
    $navbar->AddOption('Organograma', 'common', "main:mad:organograma");
    $MIOLO->InvokeHandler($module, "organograma/$action");
?>
