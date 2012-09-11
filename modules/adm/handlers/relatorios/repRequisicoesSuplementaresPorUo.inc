<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisições Suplementares Por UO', $module, $self);
$form = $ui->GetForm($module,'frmRepRequisicoesSuplementaresPorUo','','relatorios');
$theme->InsertContent($form);
?>
