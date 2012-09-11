<?

$navbar->AddOption('Browser',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmBrowserInfo');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
