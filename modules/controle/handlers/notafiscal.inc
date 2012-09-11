<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Controle de Veículos',$module,'main:manutencaoveiculo');
    $navbar->AddOption('Nota Fiscal','controle', 'main:notafiscal:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'notafiscal/find');
            break;
        case 'new':
			$MIOLO->InvokeHandler($module, 'notafiscal/new');
            break;
		case 'notamanutencao':
		    $MIOLO->InvokeHandler($module, 'notafiscal/notamanutencao');
		break;
        default:
            $MIOLO->InvokeHandler($module, 'notafiscal/main');
   }
?>
