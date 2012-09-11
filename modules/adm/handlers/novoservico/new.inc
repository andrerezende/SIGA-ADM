<?
   $theme->ClearContent();
   $ui = $MIOLO->GetUI();
   $navbar->AddOption('Novo Servico','adm','main:novoservico:new');
   $form = $ui->GetForm('adm','frmNovoServicoNew',NULL,'novoservico');
   $theme->InsertContent($form);
?>
