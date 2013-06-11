<?
    $action = $context->ShiftAction();
    //$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:find');
    $navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
    switch($action)
    {
        default:
            $MIOLO->InvokeHandler($module, 'veiculoreq/main');
    }
?>
