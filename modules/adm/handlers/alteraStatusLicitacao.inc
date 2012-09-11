<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Alterar Status da Licitação', $module, $self);
$form = $ui->GetForm($module,'frmAlteraStatusLicitacao');
$theme->InsertContent($form);
?>
