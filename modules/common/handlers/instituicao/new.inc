<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Instituição', 'adm', 'main:instituicao:new');
	$form = $ui->GetForm('common','frmInstituicaoNew',NULL,'instituicao');
	$theme->InsertContent($form);
?>