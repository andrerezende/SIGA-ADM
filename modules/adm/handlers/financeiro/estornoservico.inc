<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Estorno de Serviço', 'adm', 'main:financeiro:estornoservico');
	$form = $ui->GetForm('adm','frmEstornoServico',NULL,'financeiro');
	$theme->InsertContent($form);
?>
