<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$objLicitacao = $MIOLO->GetBusiness('adm','licitacao', $item);
$navbar->AddOption('Licitação', 'adm', 'main:listarLicitacoes:find');
$navbar->AddOption('Licitação n&ordm; '.$objLicitacao->idLicitacao, 'adm', 'main:licitacoes:find;',$objLicitacao->idLicitacao);
$navbar->AddOption('Vencedores', $module, $self);
$form = $ui->GetForm($module,'frmRepResultado');
$theme->InsertContent($form);
?>