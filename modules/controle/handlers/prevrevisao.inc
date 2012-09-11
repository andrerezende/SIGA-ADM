<?
	$action = $context->ShiftAction();
	$navbar->AddOption('Controle de Veículos',$module,'main:manutencaoveiculo');
	$navbar->AddOption('Previsão de Revisão','controle','main:prevrevisao:find');
	
    switch($action)
    {
	    case 'find':
    		$MIOLO->InvokeHandler($module, 'prevrevisao/find');
        break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'prevrevisao/new');
        break;

        default:
            $MIOLO->InvokeHandler($module, 'prevrevisao/main');
        
    }
?>
