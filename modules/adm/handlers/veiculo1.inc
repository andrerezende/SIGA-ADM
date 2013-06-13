<?
    if($perms->CheckAccess('ADM_VEICULO',A_ACCESS,true))
    $action = $context->ShiftAction();
    $navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
    /*$navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Veiculo', 'adm', 'main:veiculo:find');*/
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'veiculo1/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'veiculo1/new');
            break;
        case 'new2':
            $MIOLO->InvokeHandler($module, 'veiculo1/new2');
            break;
        case 'new3':
            $MIOLO->InvokeHandler($module, 'veiculo1/new3');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'veiculo1/main');
        }
?>
