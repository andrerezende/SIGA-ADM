<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Serviço', 'adm', 'main:servicos:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'servicos/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'servicos/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'servicos/main');
    }
?>
