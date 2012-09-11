<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Consulta Licitação Original', 'adm', 'main:financeiro:licitacaooriginal');
	$form = $ui->GetForm('adm','frmLicitacaoOriginal',NULL,'financeiro');
	$theme->InsertContent($form);
?>
