<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $servInterno = $MIOLO->GetUI();
    $objServInterno = $MIOLO->GetBusiness('adm','tiposervint',$item);
    $navbar->AddOption($objServInterno->descricao,'adm','main:servInterno:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmServInterno', $objServInterno, 'servInterno');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
