<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Ordem de Entrega Por Faixa', $module, $self);
$form = $ui->GetForm($module,'frmRepOrdemEntregaPorFaixa');
$theme->InsertContent($form);
?>
