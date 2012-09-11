<?
$navbar->AddOption('Pessoas','common',$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm('common','frmPessoas');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
