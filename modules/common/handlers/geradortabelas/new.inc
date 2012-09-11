<?php
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Cadastro Nova Tabela para Gerador de Relatórios','common','main:mad:geradortabelas:new');
	$form = $ui->GetForm('common','frmGeradorTabelasNew',NULL,'geradortabelas');
	$theme->InsertContent($form);
?>