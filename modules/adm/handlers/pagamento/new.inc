<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Pagamento', 'adm', 'main:pagamento:new');
	$form = $ui->GetForm('adm','frmPagamentoNew',NULL,'pagamento');
	$theme->InsertContent($form);
?>
