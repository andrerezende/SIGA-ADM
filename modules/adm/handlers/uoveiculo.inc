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
        case 'newend':
            $MIOLO->InvokeHandler($module, 'uoveiculo/newend');
            break;
        case 'loginmot':
            $MIOLO->InvokeHandler($module, 'uoveiculo/loginmot');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'uoveiculo/main');
        }
?>
