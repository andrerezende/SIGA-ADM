<?
    $action = $context->ShiftAction();
    //$navbar->AddOption('Consultas','adm','main:consultas');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'novomaterial/find');
        break;
		case 'delete':
            $MIOLO->InvokeHandler($module, 'novomaterial/delete');
        break;
        case 'new':
             $MIOLO->InvokeHandler($module, 'novomaterial/new');
        break;
        default:
			$MIOLO->InvokeHandler($module, 'novomaterial/main');
        break;
    }
?>
