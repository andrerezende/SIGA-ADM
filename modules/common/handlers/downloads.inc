<?

$navbar->AddOption('Downloads',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmDownloads');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
