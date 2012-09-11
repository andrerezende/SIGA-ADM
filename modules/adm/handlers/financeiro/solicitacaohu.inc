<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Solicitação para Itens de Licitação - HU', 'adm', 'main:financeiro:solicitacaohu');
	$form = $ui->GetForm('adm','frmSolicitacaoHU',NULL,'financeiro');
	$theme->InsertContent($form);
?>
