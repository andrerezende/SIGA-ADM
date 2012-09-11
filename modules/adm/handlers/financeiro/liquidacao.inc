<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Liquidação', 'adm', 'main:financeiro:liquidacao');
	$form = $ui->GetForm('adm','frmLiquidacao',NULL,'financeiro');
	$theme->InsertContent($form);
?>
