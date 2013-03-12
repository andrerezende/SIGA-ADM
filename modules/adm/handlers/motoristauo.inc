<?
    $action = $context->ShiftAction();
    //$navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('MotoristaUo', 'adm', 'main:motoristauo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'motoristauo/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'motoristauo/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'motoristauo/main');
        }
?>