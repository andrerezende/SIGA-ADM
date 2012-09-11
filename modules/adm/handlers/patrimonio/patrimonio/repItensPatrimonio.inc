<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Itens Patrimoniais', 'adm', 'main:patrimonio:repItensPatrimonio');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepItensPatrimonio', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
