<?
    $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main';
    $navbar->AddOption('Municipio', 'common', "main:municipio:find");
    $MIOLO->InvokeHandler($module, "municipio/$action");
?>
