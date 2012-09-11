<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Nova Grupo','common','main:mad:grupo:new');
    $form = $ui->GetForm('common','frmGrupoNew',NULL,'grupo');
    $theme->InsertContent($form);
?>
