<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Pagamento', 'adm', 'main:pagamento:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'pagamento/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'pagamento/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'pagamento/main');
        }
?>
