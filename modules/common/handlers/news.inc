<?

$perms->CheckAccess('noticia',A_ACCESS,true);
$navbar->AddOption('Notícias',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmNoticia');
$theme->ClearContent();
$theme->InsertContent($form->datagrid);
$theme->InsertContent($form);
?>
