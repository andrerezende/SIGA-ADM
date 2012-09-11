<?
    $perms->checkAccess('', A_ACCESS,true);
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm($module,'frmPessoaNova',NULL,'pessoa');
	$theme->InsertContent($form);
?>