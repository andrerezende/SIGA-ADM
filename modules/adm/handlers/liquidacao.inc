<?
    $action = $context->ShiftAction();

    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Liquidação', 'adm', 'main:liquidacao:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'liquidacao/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'liquidacao/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'liquidacao/main');
        }
?>
