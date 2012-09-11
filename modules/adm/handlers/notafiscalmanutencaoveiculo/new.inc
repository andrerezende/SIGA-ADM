<?
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Nota Fiscal','adm','notafiscalmanutencaoveiculo:new');
	$form = $ui->GetForm('adm','frmNotaFiscalNew',NULL,'notafiscalmanutencaoveiculo');
	$theme->InsertContent($form);
?>
