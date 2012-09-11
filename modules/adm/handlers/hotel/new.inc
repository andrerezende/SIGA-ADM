<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Hotel', 'adm', 'main:hotel:new');
	$form = $ui->GetForm('adm','frmHotelNew',NULL,'hotel');
	$theme->InsertContent($form);
?>
