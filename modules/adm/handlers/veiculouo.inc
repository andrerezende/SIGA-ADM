<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    //$navbar->AddOption('Veiculo', 'adm', 'main:veiculouo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'veiculouo/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'veiculouo/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'veiculouo/main');
        }
?>