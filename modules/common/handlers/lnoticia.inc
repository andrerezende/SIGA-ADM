<?
$navbar->AddOption('Notícias','common',$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm('common','frmLNoticia');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
