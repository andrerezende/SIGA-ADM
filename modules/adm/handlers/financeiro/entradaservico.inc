<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Entrada de Serviço', 'adm', 'main:financeiro:entradaservico');
	$form = $ui->GetForm('adm','frmFinanceiroEntradaServicoEmpenho',NULL,'financeiro');
	$theme->InsertContent($form);
?>
