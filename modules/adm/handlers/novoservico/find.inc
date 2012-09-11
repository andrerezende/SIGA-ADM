<?   
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Pesquisar Serviços','adm','main:novoservico:find');
    $form = $ui->GetForm('adm','frmNovoServicoFind',NULL,'novoservico');
    $theme->InsertContent($form);
?>
