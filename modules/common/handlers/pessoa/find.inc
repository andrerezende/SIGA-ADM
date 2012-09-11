<?
    $perms->checkAccess('', A_ACCESS,true);
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm($module,'frmPessoasFind',NULL,'pessoa');
	$theme->InsertContent($form);
?>

