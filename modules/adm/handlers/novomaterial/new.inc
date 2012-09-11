<?
   $theme->ClearContent();
   $ui = $MIOLO->GetUI();
   $navbar->AddOption('Solicitar Cadastro de Material','adm','main:novomaterial:new');
   $form = $ui->GetForm('adm','frmNovoMaterialNew',NULL,'novomaterial');
   $theme->InsertContent($form);
?>
