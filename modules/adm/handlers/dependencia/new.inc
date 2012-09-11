<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Dependência', 'adm', 'main:dependencia:new');
	$form = $ui->GetForm('adm','frmDependenciaNew',NULL,'dependencia');
	$theme->InsertContent($form);
?>
