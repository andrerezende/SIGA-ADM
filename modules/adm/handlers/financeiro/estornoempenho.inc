<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Estorno de Empenho', 'adm', 'main:financeiro:estornoempenho');
	$form = $ui->GetForm('adm','frmEstornoEmpenho',NULL,'financeiro');
	$theme->InsertContent($form);
?>