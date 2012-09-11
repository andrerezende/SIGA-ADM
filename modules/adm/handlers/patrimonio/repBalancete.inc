<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Balancete', 'adm', 'main:patrimonio:repBalancete');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepBalancete', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
