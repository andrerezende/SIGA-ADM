<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Classificador por Elemento de Despesa', 'adm', 'main:patrimonio:repClassificadorPorElemento');
	$form = $MIOLO->GetUI()->GetForm($module,'frmRepClassificadorPorElemento', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
