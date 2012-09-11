<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Baixas no Período', 'adm', 'main:patrimonio:repBaixasPorPeriodo');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepBaixasPorPeriodo', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
