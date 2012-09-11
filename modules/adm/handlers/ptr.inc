<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('PTR', 'adm', 'main:ptr:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'ptr/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'ptr/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'ptr/main');
        }
?>
