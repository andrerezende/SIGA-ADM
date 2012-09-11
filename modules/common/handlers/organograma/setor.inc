<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Setor', 'common', 'main:organograma:setor');
	$form = $ui->GetForm('common','frmSetor',NULL,'organograma');
	$theme->InsertContent($form);
?>
