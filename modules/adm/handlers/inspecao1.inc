<?
    $action = $context->ShiftAction();
    $navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'inspecao1/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'inspecao1/new');
            break; 
        case 'final':
            $MIOLO->InvokeHandler($module, 'inspecao1/final');
            break;
        case 'loginmot':
            $MIOLO->InvokeHandler($module, 'inspecao1/loginmot');
            break;
        case 'itemmotorista':
            $MIOLO->InvokeHandler($module, 'inspecao1/itemmotorista');
            break;
        case 'inspecaoview':
            $MIOLO->InvokeHandler($module, 'inspecao1/inspecaoview');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'inspecao1/main');
        }
?>
