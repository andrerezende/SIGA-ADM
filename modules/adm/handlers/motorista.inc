<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Motorista', 'adm', 'main:motorista:find');
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
