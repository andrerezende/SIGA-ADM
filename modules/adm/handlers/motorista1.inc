<?
    $action = $context->ShiftAction();
    //$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:find');
    $navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'motorista1/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'motorista1/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'motorista1/main');
    }
?>
