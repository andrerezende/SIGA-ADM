<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Aquisições no Período', 'adm', 'main:patrimonio:repAquisicoesPorPeriodo');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepAquisicoesPorPeriodo', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
