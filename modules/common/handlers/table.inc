<?

$perms->CheckAccess('tabelageral',A_ACCESS,true);
$navbar->AddOption('Tabela Geral',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmTabelaGeral');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
