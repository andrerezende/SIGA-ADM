<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Novo Banco', 'common', 'main:banco:new');
    $form = $ui->GetForm('common','frmBancoNew',NULL,'banco');
    $theme->InsertContent($form);
?>
