<?
	$action = $context->ShiftAction();
	$navbar->AddOption('Pesquisar Grupo','common','main:mad:grupo:find');
	switch($action)
	{
		case 'find':
			$MIOLO->InvokeHandler($module,'grupo/find');
			break;
		case 'new':
			$MIOLO->InvokeHandler($module,'grupo/new');
			break;
		default:
			$MIOLO->InvokeHandler($module,'grupo/main');
			break;
	}
?>
