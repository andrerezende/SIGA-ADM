<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Totais por Classificador', 'adm', 'main:patrimonio:repTotaisPorClassificador');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepTotaisPorClassificador', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
