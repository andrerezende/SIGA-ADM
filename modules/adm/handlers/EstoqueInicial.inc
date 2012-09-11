<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Gerar Estoque Inicial', $module, $self);
$form = $ui->GetForm($module,'frmEstoqueInicial');
$theme->InsertContent($form);
?>
