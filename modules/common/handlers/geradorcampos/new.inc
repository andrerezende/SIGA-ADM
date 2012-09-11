<?php
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Cadastro Novo Campo para Gerador de Relatórios','common','main:mad:geradorcampos:new');
	$form = $ui->GetForm('common','frmGeradorCamposNew',NULL,'geradorcampos');
	$theme->InsertContent($form);
?>