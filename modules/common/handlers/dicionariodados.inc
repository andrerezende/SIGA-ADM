<?php
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Dicionário de Dados', 'common', 'main:dicionariodados');
	$form = $ui->GetForm('common','frmDicionarioDados',NULL);
	$theme->InsertContent($form);
?>