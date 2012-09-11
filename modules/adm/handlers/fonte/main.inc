<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $fonte = $MIOLO->GetUI();
    $objFonte = $MIOLO->GetBusiness('adm','fonte', $item);
    $navbar->AddOption($objFonte->descricao, 'adm', 'main:fonte:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmFonte', $objFonte, 'fonte');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>