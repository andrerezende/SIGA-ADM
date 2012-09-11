<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Transação','common','main:mad:transacao:new');
	$form = $ui->GetForm('common','frmTransacaoNew',NULL,'transacao');
	$theme->InsertContent($form);
?>
