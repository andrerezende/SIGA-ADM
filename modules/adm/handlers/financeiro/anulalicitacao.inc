<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Anulação de Itens de Licitação', 'adm', 'main:financeiro:anulalicitacao');
	$form = $ui->GetForm('adm','frmAnulaLicitacao',NULL,'financeiro');
	$theme->InsertContent($form);
?>
