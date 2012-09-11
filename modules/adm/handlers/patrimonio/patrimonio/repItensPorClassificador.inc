<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Itens por Classificador', 'adm', 'main:patrimonio:repItensPorClassificador');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepItensPorClassificador', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
