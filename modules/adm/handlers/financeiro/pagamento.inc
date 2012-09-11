<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Pagamento', 'adm', 'main:financeiro:pagamento');
	$form = $ui->GetForm('adm','frmPagamento',NULL,'financeiro');
	$theme->InsertContent($form);
?>
