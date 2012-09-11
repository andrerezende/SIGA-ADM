<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Taxi', 'adm', 'main:taxi:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'taxi/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'taxi/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'taxi/main');
        }
?>
