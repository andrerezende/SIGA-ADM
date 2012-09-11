<?
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Empresa','adm','empresamanutencaoveiculo:new');
	$form = $ui->GetForm('adm','frmEmpresaNew',NULL,'empresamanutencaoveiculo');
	$theme->InsertContent($form);
?>
