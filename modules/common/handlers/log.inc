<?

$perms->CheckAccess('log',A_ACCESS,true);
$navbar->AddOption('Log',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmLog');
$theme->InsertContent($form);
?>
