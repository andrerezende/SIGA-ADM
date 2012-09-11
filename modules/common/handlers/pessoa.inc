<?
    $perms->checkAccess('', A_ACCESS,true);
    $action = $context->ShiftAction();
    $navbar->AddOption('Pessoas', 'common', 'main:pessoa:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'pessoa/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'pessoa/new');
            break;
        case 'nova':
            $MIOLO->InvokeHandler($module, 'pessoa/nova');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'pessoa/main');
    }
?>