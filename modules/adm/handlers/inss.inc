<?	global $MIOLO, $module;
	$action = $context->ShiftAction();
	$navbar->AddOption('Manutenção',$module,'main:manutencao');
	$navbar->AddOption('INSS',$module,'main:inss:find');
	switch($action)
	{
		case 'find':
			$MIOLO->InvokeHandler($module,'inss/find');
			break;
		case 'new':
			$MIOLO->InvokeHandler($module,'inss/new');
			break;
		default:
			$MIOLO->InvokeHandler($module,'inss/main');
			break;
	}
?>
