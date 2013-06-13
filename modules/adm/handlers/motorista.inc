<?
    $action = $context->ShiftAction();
    //$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:find');
    $navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'motorista/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'motorista/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'motorista/main');
    }
?>
