<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Itens de Licitação por Fornecedor', $module, $self);
$form = $ui->GetForm($module,'frmRepItensLicitacaoByFornecedor');
$theme->InsertContent($form);
?>
