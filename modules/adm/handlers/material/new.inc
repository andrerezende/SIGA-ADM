<?
   $theme->ClearContent();
   $ui = $MIOLO->GetUI();
   $navbar->AddOption('Novo Material', 'adm', 'main:material:new');
   $form = $ui->GetForm('adm','frmMaterialNew',NULL,'material');
   $theme->InsertContent($form);
?>