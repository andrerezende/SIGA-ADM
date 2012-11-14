<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Unidade', 'adm', 'main:unidade:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'unidade/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'unidade/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'unidade/main');
        }
?>