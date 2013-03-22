<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Inspeção', 'adm', 'main:inspecao:new');
	$form = $ui->GetForm('adm','frmInspecaoNew',NULL,'inspecao');
	$theme->InsertContent($form);
?>
