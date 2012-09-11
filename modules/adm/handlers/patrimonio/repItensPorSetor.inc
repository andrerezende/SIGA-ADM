<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Itens por Setor', 'adm', 'main:patrimonio:repItensPorSetor');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepItensPorSetor', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
