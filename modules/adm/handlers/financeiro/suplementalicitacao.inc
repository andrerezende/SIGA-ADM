<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Suplementação de Licitação', 'adm', 'main:financeiro:suplementalicitacao');
	$form = $ui->GetForm('adm','frmSuplementaLicitacao',NULL,'financeiro');
	$theme->InsertContent($form);
?>
