<?$perms->CheckAccess('adm',A_ACCESS,true);
    $action = $context->ShiftAction();
    $navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'uoveiculo/find');
            break;
        case 'newveiculo':
            $MIOLO->InvokeHandler($module, 'uoveiculo/newveiculo');
            break;
        case 'newmoto':
            $MIOLO->InvokeHandler($module, 'uoveiculo/newmoto');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'uoveiculo/main');
        }
?>
