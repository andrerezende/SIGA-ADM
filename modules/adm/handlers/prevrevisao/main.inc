<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objPrevRevisao = $MIOLO->GetBusiness('adm','prevrevisao',$item);

    $navbar->AddOption($objPrevRevisao->idPrevRevisao, 'adm', 'main:prevrevisao:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmPrevRevisao', $objPrevRevisao, 'prevrevisao');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
