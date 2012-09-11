<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Anulação/Cancelamento de Empenho', 'adm', 'main:financeiro:anulacao');
	$form = $ui->GetForm('adm','frmAnulacaoEmpenho',NULL,'financeiro');
	$theme->InsertContent($form);
?>
