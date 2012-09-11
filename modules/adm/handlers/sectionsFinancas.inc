<?
$perms->CheckAccess('adm_financas',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Finanças',$module,$self);
$panel = new ActionPanel('pnlOpFinancas','Operações');
$panel->AddUserAction('adm_financas',A_ACCESS,'Empenhar Licitações',$ui->GetImage($module,'abrir_licitacao.png'),$module,'main:empenho');
$panel2 = new ActionPanel('pnlRepFinancas','Relatórios Disponíveis');
$theme->InsertContent($panel2);
$theme->InsertContent($panel);
?>
