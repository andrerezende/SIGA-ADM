<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'uoveiculo/find');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'uoveiculo/main');
        }
?>
