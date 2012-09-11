<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Entrada de Serviços', 'adm', 'main:financeiro:entradaservico');
	$form = $ui->GetForm('adm','frmFinanceiroEntradaServicoEmpenhosFind',NULL,'financeiro');
	$theme->InsertContent($form);
?>
