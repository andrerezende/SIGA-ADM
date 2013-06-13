<?
$perms->CheckAccess('adm',A_ACCESS,true);
	//$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm('adm','frmUoVeiculoFind',NULL,'uoveiculo');
	$theme->InsertContent($form);
?>
