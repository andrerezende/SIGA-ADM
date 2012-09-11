<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $valeTransporte = $MIOLO->GetUI();
    $objValeTransporte = $MIOLO->GetBusiness('adm','valetransporte', $item);
    $navbar->AddOption($objValeTransporte->dataIni, 'adm', 'main:valetransporte:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmValeTransporte', $objValeTransporte, 'valetransporte');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
