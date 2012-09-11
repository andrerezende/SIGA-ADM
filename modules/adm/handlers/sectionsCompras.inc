<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Licitações',$module,$self);

$panel = new ActionPanel('pnlOpCompras','Operações');
$panel->SetIconType('small');

$panel->AddUserAction('adm_compras',A_ACCESS,'Licitações',$ui->GetImage($module,'licitacoesEmAndamento.png'),$module,'main:licitacoesAbertas');
$panel->AddUserAction('adm_compras',A_ACCESS,'Itens a Licitar',$ui->GetImage($module,'abrir_licitacao.png'),$module,'main:itensALicitar');
$panel->AddUserAction('adm_compras',A_ACCESS,'Nova Licitação',$ui->GetImage($module,'news_subscribe.png'),$module,'main:licitacoes:new');
$panel->AddUserAction('adm_compras',A_ACCESS,'Participantes',$ui->GetImage($module,'pessoa.png'),$module,'main:gestaoParticipantes');
$panel->AddUserAction('adm_compras',A_ACCESS,'Propostas',$ui->GetImage($module,'funcionario.png'),$module,'main:proposta');
$panel->AddUserAction('adm_compras',A_ACCESS,'Vencedores',$ui->GetImage($module,'vencedores.png'),$module,'main:vencedores');
$panel->AddUserAction('adm_compras',A_ACCESS,'Mudar Status',$ui->GetImage($module,'muda_status.png'),$module,'main:alteraStatusLicitacao');

$panel2 = new ActionPanel('pnlRepCompras','Relatórios Disponíveis');
$panel2->SetIconType('small');
$panel2->AddUserAction('adm_compras',A_ACCESS,'Convites',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repItensLicitacaoByFornecedor');
$panel2->AddUserAction('adm_compras',A_ACCESS,'Mapa',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repMapaLicitacao');

$theme->InsertContent($panel2);
$theme->InsertContent($panel);
?>
