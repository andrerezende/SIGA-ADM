<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Consulta de Empenho', 'adm', 'main:financeiro:controle');
	$form = $ui->GetForm('adm','frmControleEmpenho',NULL,'financeiro');
	$theme->InsertContent($form);
?>
