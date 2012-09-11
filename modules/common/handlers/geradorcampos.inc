<?php
	$action = $context->ShiftAction();
	$navbar->AddOption('Gerador de Relatórios Cadastro de Campos','common','main:mad:geradorcampos:find');
	switch($action)
	{
		case 'find':
			$MIOLO->InvokeHandler($module,'geradorcampos/find');
			break;
		case 'new':
			$MIOLO->InvokeHandler($module,'geradorcampos/new');
			break;
		default:
			$MIOLO->InvokeHandler($module,'geradorcampos/main');
			break;
	}
?>