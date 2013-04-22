<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Inspeção', 'adm', 'main:inspecao:final');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'inspecao/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'inspecao/new');
            break; 
        case 'final':
            $MIOLO->InvokeHandler($module, 'inspecao/final');
            break;
        case 'loginmot':
            $MIOLO->InvokeHandler($module, 'inspecao/loginmot');
            break;
        case 'itemmotorista':
            $MIOLO->InvokeHandler($module, 'inspecao/itemmotorista');
            break;
        case 'inspecaoview':
            $MIOLO->InvokeHandler($module, 'inspecao/inspecaoview');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'inspecao/main');
        }
?>
