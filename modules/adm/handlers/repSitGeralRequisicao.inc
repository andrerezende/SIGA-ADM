<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Situação Geral de Requisições', $module, $self);
$form = $ui->GetForm($module,'frmRepSitGeralRequisicao','','relatorios');
$theme->InsertContent($form);
?>
