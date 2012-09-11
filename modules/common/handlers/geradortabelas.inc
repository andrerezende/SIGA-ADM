<?php
	$action = $context->ShiftAction();
	$navbar->AddOption('Gerador de Relatórios Cadastro de Tabelas','common','main:mad:geradortabelas:find');
	switch($action)
	{
		case 'find':
			$MIOLO->InvokeHandler($module,'geradortabelas/find');
			break;
		case 'new':
			$MIOLO->InvokeHandler($module,'geradortabelas/new');
			break;
		default:
			$MIOLO->InvokeHandler($module,'geradortabelas/main');
			break;
	}
?>