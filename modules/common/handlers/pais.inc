<?
    $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main'; 
    $navbar->AddOption('Pais', 'common', "main:pais:find");
    $MIOLO->InvokeHandler($module, "pais/$action");
?>
