<?
	if($perms->CheckAccess('ADM_ITEMPATRIMONIO',A_ACCESS,true))
    $theme->ClearContent();
    $objItemPatrimonio = $MIOLO->GetBusiness('adm','itempatrimonio', $item);
    $navbar->AddOption($objItemPatrimonio->descricao, 'adm', 'main:itempatrimonio:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmItemPatrimonioFind', $objItemPatrimonio, 'itempatrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
