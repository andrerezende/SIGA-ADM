<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Veiculo', 'adm', 'main:veiculo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'veiculo/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'veiculo/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'veiculo/main');
        }
?>
