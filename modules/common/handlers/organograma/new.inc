<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Organograma', 'common', 'main:organograma:new');
	$form = $ui->GetForm('common','frmOrganogramaNew',NULL,'organograma');
	$theme->InsertContent($form);
?>
