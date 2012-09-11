<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Consulta de Solicitação para Itens de Licitação', 'adm', 'main:financeiro:consultasolicitacao');
	$form = $ui->GetForm('adm','frmConsultaSolicitacao',NULL,'financeiro');
	$theme->InsertContent($form);
?>
