<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Termo', 'adm', 'main:patrimonio:repTermo2');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepTermo2', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
