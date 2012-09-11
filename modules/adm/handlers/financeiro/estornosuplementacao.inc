<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Estorno de Suplementação', 'adm', 'main:financeiro:estornosuplementacao');
	$form = $ui->GetForm('adm','frmEstornoSuplementacao',NULL,'financeiro');
	$theme->InsertContent($form);
?>
