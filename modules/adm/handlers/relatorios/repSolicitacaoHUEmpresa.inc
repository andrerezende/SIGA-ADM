<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Solicitação HU por Empresa', $module, $self);
$form = $ui->GetForm($module,'frmRepSolicitacaoHUEmpresa','','relatorios');
$theme->InsertContent($form);
?>
