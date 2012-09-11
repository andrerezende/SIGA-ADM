<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Licitações Abertas', $module, $self);
$form = $ui->GetForm($module,'frmLicitacoesAbertas');
$theme->InsertContent($form);
?>
