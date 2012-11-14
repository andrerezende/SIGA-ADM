<?
	if($perms->CheckAccess('ADM_UNIDADE',A_ACCESS,true))
    $theme->ClearContent();
    $objUnidade = $MIOLO->GetBusiness('adm','unidade', $item);
    $navbar->AddOption($objUnidade->sigla, 'adm', 'main:unidade:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmUnidade', $objUnidade, 'unidade');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
