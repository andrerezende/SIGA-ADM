<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Totais por Classificador no Período', 'adm', 'main:patrimonio:repTotaisPorClassificadorPeriodo');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepTotaisPorClassificadorPeriodo', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
