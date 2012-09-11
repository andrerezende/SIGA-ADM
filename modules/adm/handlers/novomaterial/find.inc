<?   
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Pesquisar Materiais','adm','main:novomaterial:find');
    $form = $ui->GetForm('adm','frmNovoMaterialFind',NULL,'novomaterial');
    $theme->InsertContent($form);
?>
