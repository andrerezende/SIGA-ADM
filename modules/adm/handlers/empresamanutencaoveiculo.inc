<?
    $action = $context->ShiftAction();
	$navbar->AddOption('Manutenção de Veículos',$module,'main:manutencaoveiculo');
    $navbar->AddOption('Empresa', 'adm', 'main:empresamanutencaoveiculo:find');
    switch($action)
    {
       	case 'find':
			$MIOLO->InvokeHandler($module, 'empresamanutencaoveiculo/find');
			break;
		case 'new':
            $MIOLO->InvokeHandler($module, 'empresamanutencaoveiculo/new');
        	break;
        default:
            $MIOLO->InvokeHandler($module, 'empresamanutencaoveiculo/main');
        
    }
?>