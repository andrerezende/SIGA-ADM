<?
	if($perms->CheckAccess('ADM',A_ACCESS,true))
    $theme->ClearContent();
    $objEmpenho = $MIOLO->GetBusiness('adm','empenho', $item);
    $navbar->AddOption('', 'adm', 'main:empenho:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmEmpenhoEntregaMaterial',$objEmpenho,'empenho');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
