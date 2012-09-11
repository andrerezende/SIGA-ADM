<?

$perms->CheckAccess('admin',A_ACCESS,true);
$home = 'main:admin';
$navbar->AddOption('Transações',$module,$self);
$ui = $MIOLO->GetUI();

// by thiago $form = $ui->GetForm($module,'frmTransacao');
$form = $ui->GetForm($module,'frmTransacao');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
