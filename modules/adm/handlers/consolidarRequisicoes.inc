<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Consolidar Requisições', $module, $self);
$form = $ui->GetForm($module,'frmConsolidarRequisicoes');
$theme->InsertContent($form);
?>
