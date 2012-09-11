<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Atendimento de Solicitação para Itens de Licitação', 'adm', 'main:financeiro:solicitacao');
	$form = $ui->GetForm('adm','frmSolicitacao',NULL,'financeiro');
	$theme->InsertContent($form);
?>
