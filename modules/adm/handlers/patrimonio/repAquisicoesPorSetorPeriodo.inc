<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Aquisições por Setor no Período', 'adm', 'main:patrimonio:repAquisicoesPorSetorPeriodo');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepAquisicoesPorSetorPeriodo', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
