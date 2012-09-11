<?
$perms->CheckAccess('adm_requisicao',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisição de Material', $module, $self);
$form = $ui->GetForm($module,'frmRequisicao');
$theme->InsertContent($form);
?>
