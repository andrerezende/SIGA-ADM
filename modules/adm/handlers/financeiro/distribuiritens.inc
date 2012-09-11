<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Distribuir Itens Empenhados', 'adm', 'main:financeiro:distribuiritens');
	$form = $ui->GetForm('adm','frmDistribuirItens',NULL,'financeiro');
	$theme->InsertContent($form);
?>
