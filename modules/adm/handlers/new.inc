<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Taxi', 'adm', 'main:taxi:new');
	$form = $ui->GetForm('adm','frmTaxiNew',NULL,'taxi');
	$theme->InsertContent($form);
?>
