<?
	 if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $irrf = $MIOLO->GetUI();
    $objInss = $MIOLO->GetBusiness('common','inss', $item);
	 $navbar->AddOption($objInss->idInss, 'adm', 'main:inss:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmInss', $objInss, 'inss');
	$theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
	