<?
$navbar->AddOption('Contato',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmContato');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
