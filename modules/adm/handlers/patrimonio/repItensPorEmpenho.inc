<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Itens por Empenho', 'adm', 'main:patrimonio:repItensPorEmpenho');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepItensPorEmpenho', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
