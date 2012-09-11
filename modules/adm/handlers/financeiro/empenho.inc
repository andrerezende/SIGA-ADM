<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Atribuir Orçamento', 'adm', 'main:financeiro:empenho');
	$form = $ui->GetForm('adm','frmDefinicaoOrcamento',NULL,'financeiro');
	$theme->InsertContent($form);
?>