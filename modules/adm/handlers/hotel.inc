<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Hotel', 'adm', 'main:hotel:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'hotel/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'hotel/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'hotel/main');
        }
?>
