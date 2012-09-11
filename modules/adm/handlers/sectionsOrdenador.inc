<?
$perms->CheckAccess('adm_ordenador',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Ordenador de Despesas',$module,$self);
$panel = new ActionPanel('pnlDestino','Ordenador de Despesas');
//$panel->AddUserAction('adm_ordenador',A_ACCESS,'Controle de Requisições',$ui->GetImage('','button_edit.png'),$module,'main:reqext');
$panel->AddUserAction('adm_ordenador',A_ACCESS,'Ordem de Despesas',$ui->GetImage($module,'vencedores.png'),$module,'main:ordenador');
//$panel->AddUserAction('adm_ordenador',A_ACCESS,'Requisição',$ui->GetImage('','button_edit.png'),$module,'main:relatoriorequisicao');
$theme->InsertContent($panel);
?>
