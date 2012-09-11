<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Patrimônio', 'adm', 'main:itempatrimonio:main');
	$form = $MIOLO->GetUI()->GetForm($module,'frmPatrimonio', $objPatrimonio, 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
