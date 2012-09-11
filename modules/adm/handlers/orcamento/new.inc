<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Orçamento', 'adm', 'main:orcamento:new');
	$form = $ui->GetForm('adm','frmOrcamentoNew',NULL,'orcamento');
	$theme->InsertContent($form);
?>
