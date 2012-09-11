<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objLicitacao = $MIOLO->GetBusiness('adm','licitacao', $item);

    //$navbar->AddOption('Licitação n&ordm; '.$objLicitacao->numero, 'adm', 'main:listarLicitacoes:main');

    $navbar->AddOption('Licitação n&ordm; '.$objLicitacao->numero, 'adm', 'main:licitacoes:listaLicitacoes');

    $form = $ui->GetForm('adm','frmLicitacao', $objLicitacao, 'licitacoes');
    $theme->InsertContent($form);
?>
