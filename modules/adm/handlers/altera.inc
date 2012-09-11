<?
  $perms->CheckAccess('admin',A_ACCESS,true);
  $theme->ClearContent();
  $ui = $MIOLO->GetUI();
  $navbar->AddOption('Manutenção',$module,'main:manutencao');
  $navbar->AddOption('Alterar', 'adm', 'main:altera');
  $form = $ui->GetForm($module,'frmAlteraPessoa');
  $theme->InsertContent($form);
?>