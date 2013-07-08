<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $objInspecao = $MIOLO->GetBusiness('adm','inspecao', $item);
    //$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmInspecaoComponenteNew', $objInspecao, 'inspecao');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
