<?
	$action = $context->ShiftAction();
	$navbar->AddOption('Pesquisar Transações','common','main:mad:transacao:find');
	switch($action)
	{
		case 'find':
			$MIOLO->InvokeHandler($module,'transacao/find');
			break;
		case 'new':
			$MIOLO->InvokeHandler($module,'transacao/new');
			break;
		default:
			$MIOLO->InvokeHandler($module,'transacao/main');
			break;
	}
?>
