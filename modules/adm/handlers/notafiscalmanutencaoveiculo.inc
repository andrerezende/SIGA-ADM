<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção de Veículos',$module,'main:manutencaoveiculo');
    $navbar->AddOption('Nota Fiscal','adm', 'main:notafiscalmanutencaoveiculo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'notafiscalmanutencaoveiculo/find');
            break;
        case 'new':
			$MIOLO->InvokeHandler($module, 'notafiscalmanutencaoveiculo/new');
            break;
		case 'notamanutencao':
		    $MIOLO->InvokeHandler($module, 'notafiscalmanutencaoveiculo/notamanutencao');
		break;
        default:
            $MIOLO->InvokeHandler($module, 'notafiscalmanutencaoveiculo/main');
   }
?>
