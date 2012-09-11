<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
	$navbar->AddOption('Responsabilidade por Setor', 'adm', 'main:patrimonio:repTermoPorSetor');
	$form = $MIOLO->GetUI()->GetForm($module,'frmTermoPorSetor', '', 'patrimonio');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
