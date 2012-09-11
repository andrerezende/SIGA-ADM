<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objTipoManutencao = $MIOLO->GetBusiness('adm','tipomanutencao',$item);

    $navbar->AddOption($objTipoManutencao->tipoManutencao, 'adm', 'main:tipomanutencao:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmTipoManutencao', $objTipoManutencao, 'tipomanutencao');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
