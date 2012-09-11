<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $taxi = $MIOLO->GetUI();
    $objTaxi = $MIOLO->GetBusiness('adm','taxi', $item);
    $navbar->AddOption($objTaxi->dataIni, 'adm', 'main:taxi:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmTaxi', $objTaxi, 'taxi');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
