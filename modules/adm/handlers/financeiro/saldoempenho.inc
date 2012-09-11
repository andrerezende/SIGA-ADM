<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Empenho', 'adm', 'main:financeiro:saldoempenho');
	$form = $ui->GetForm('adm','frmSaldoEmpenho',$item,'financeiro');

	$theme->InsertContent($form);
?>
