<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$objLicitacao = $MIOLO->GetBusiness('adm','licitacao', $item);
$navbar->AddOption('Licitações', 'adm', 'main:listarLicitacoes:find');
$navbar->AddOption('Licitação n&ordm; '.$objLicitacao->numero, 'adm', 'main:licitacoes:find;',$objLicitacao->idLicitacao);
$navbar->AddOption('Relatório de Itens', $module, $self);
$form = $ui->GetForm($module,'frmRepItens');
$theme->InsertContent($form);
?>
