<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$objLicitacao = $MIOLO->GetBusiness('adm','licitacao', $item);
$navbar->AddOption('Licitação', 'adm', 'main:listarLicitacoes:find');
$navbar->AddOption('Licitação n&ordm; '.$objLicitacao->idLicitacao, 'adm', 'main:licitacoes:find;',$objLicitacao->idLicitacao);
$navbar->AddOption('Empresas Participantes', $module, $self);
$form = $ui->GetForm($module,'frmRepEmpresasParticipantes');
$theme->InsertContent($form);
?>
