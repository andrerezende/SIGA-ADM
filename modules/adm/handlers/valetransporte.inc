<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Vale Transporte', 'adm', 'main:valetransporte:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'valetransporte/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'valetransporte/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'valetransporte/main');
        }
?>
