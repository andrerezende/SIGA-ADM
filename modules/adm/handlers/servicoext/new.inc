<?
   $theme->ClearContent();
   $ui = $MIOLO->GetUI();
   $navbar->AddOption('Novo Serviço Externo', 'adm', 'main:servicoext:new');
   $form = $ui->GetForm('adm','frmServicoextNew',NULL,'servicoext');
   $theme->InsertContent($form);
?>