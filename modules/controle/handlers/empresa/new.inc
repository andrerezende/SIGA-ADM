<?
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Empresa','controle','empresa:new');
	$form = $ui->GetForm('controle','frmEmpresaNew',NULL,'empresa');
	$theme->InsertContent($form);
?>
