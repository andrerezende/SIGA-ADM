<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Alteração de Liquidacao/Pagamento', 'adm', 'main:financeiro:alteracaoliquidacaopagamento');
	$form = $ui->GetForm('adm','frmAlteracaoLiquidacaoPagamento',NULL,'financeiro');
	$theme->InsertContent($form);
?>
