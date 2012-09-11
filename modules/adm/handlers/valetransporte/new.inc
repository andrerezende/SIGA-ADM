<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Valor', 'adm', 'main:valetransporte:new');
	$form = $ui->GetForm('adm','frmValeTransporteNew',NULL,'valetransporte');
	$theme->InsertContent($form);
?>
