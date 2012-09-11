<?
    $action = $context->ShiftAction();
	$navbar->AddOption('Controle de Veículos',$module,'main:manutencaoveiculo');
    $navbar->AddOption('Empresa', 'controle', 'main:empresa:find');
    switch($action)
    {
       	case 'find':
			$MIOLO->InvokeHandler($module, 'empresa/find');
			break;
		case 'new':
            $MIOLO->InvokeHandler($module, 'empresa/new');
        	break;
        default:
            $MIOLO->InvokeHandler($module, 'empresa/main');
        
    }
?>
