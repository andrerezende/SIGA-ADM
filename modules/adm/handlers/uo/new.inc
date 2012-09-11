<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Unidade Orçamentária', 'adm', 'main:uo:new');
	$form = $ui->GetForm('adm','frmUoNew',NULL,'uo');
	$theme->InsertContent($form);
?>
