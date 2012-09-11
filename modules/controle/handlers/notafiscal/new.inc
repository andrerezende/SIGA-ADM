<?
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Nota Fiscal','controle','notafiscal:new');
	$form = $ui->GetForm('controle','frmNotaFiscalNew',NULL,'notafiscal');
	$theme->InsertContent($form);
?>
