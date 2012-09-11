<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Inserir itens no empenho', 'adm', 'main:financeiro:itemempenho');
	$form = $ui->GetForm('adm','frmItemEmpenho',NULL,'financeiro');
	$theme->InsertContent($form);
?>