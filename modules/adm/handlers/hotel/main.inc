<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $hotel = $MIOLO->GetUI();
    $objHotel = $MIOLO->GetBusiness('adm','hotel', $item);
    $navbar->AddOption($objHotel->nome, 'adm', 'main:hotel:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmHotel', $objHotel, 'hotel');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>