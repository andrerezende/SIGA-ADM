<?

$perms->CheckAccess('grupoacesso',A_ACCESS,true);
$home = 'main:admin';
$navbar->AddOption('Grupos',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmGrupo');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
