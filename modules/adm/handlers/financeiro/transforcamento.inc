<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Transferência de Orçamento', 'adm', 'main:financeiro:transforcamento');
	$form = $ui->GetForm('adm','frmTransfOrcamento',NULL,'financeiro');
	$theme->InsertContent($form);
?>
