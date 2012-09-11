<?
    if($perms->CheckAccess('planodep',A_ACCESS,true))
    $theme->ClearContent();
    $instituicao = $MIOLO->GetUI();
    $objInstituicao = $MIOLO->GetBusiness('common','instituicao', $item);

    $navbar->AddOption(ucwords(strtolower($objInstituicao->sigla)), 'common', 'main:instituicao:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmInstituicao', $objInstituicao, 'instituicao');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>