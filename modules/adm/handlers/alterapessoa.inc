<?
  $perms->CheckAccess('admin',A_ACCESS,true);
  $theme->ClearContent();
  $ui = $MIOLO->GetUI();
  $ui = $MIOLO->GetUI();
  $objPessoa = $MIOLO->GetBusiness('common','pessoa', $item);
  $navbar->AddOption('Manutenção',$module,'main:manutencao');
  $navbar->AddOption('Alterar', 'adm', 'main:altera');
  $navbar->AddOption('Alterar Pessoa', 'adm', 'main:alterapessoa');
  $form = $ui->GetForm($module,'frmPessoaDadosPessoais',$objPessoa);
  $theme->InsertContent($form);
?>