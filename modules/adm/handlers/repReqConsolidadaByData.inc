<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Movimentos por Data', $module, $self);
$form = $ui->GetForm($module,'frmRelatMovimentosPorData');
$theme->InsertContent($form);
?>
