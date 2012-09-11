<?
$perms->CheckAccess('adm_requisicao',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisições',$module,$self);
$form = $ui->GetForm($module,'frmRequisicoes');
$theme->InsertContent($form);
$panel = new ActionPanel('req','Requisição de Material');
$panel->AddUserAction('adm_requisicao',A_ACCESS,'Listar requisições do setor',$ui->GetImage($module,'requisicao.png'),$module,'main:requisicoes');
$panel->AddUserAction('adm_requisicao',A_ACCESS,'Buscar requisições por data',$ui->GetImage($module,'requisicao.png'),$module,'main:requisicoes');
$panel->AddUserAction('adm_requisicao',A_ACCESS,'Requisitar material de almoxarifado',$ui->GetImage($module,'reqint.png'),$module,'main:requisicaointerna');
$panel->AddUserAction('adm_requisicao',A_ACCESS,'Requisitar compra de material',$ui->GetImage($module,'reqext.png'),$module,'main:requisicaoexterna');
$theme->InsertContent($panel);

?>
