<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $irrf = $MIOLO->GetUI();
    $objIrrf = $MIOLO->GetBusiness('common','irrf', $item);

    $navbar->AddOption($objIrrf->idIrrf, 'adm', 'main:irrf:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmIrrf', $objIrrf, 'irrf');

    $theme->InsertContent($form);
?>
