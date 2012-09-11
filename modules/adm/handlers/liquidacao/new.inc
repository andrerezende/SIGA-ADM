<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Liquidação', 'adm', 'main:liquidacao:new');
	$form = $ui->GetForm('adm','frmLiquidacaoNew',NULL,'liquidacao');
	$theme->InsertContent($form);
?>
