<?
    $perms->CheckAccess('SETOR',A_ACCESS,true);
    
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $objSetor = $MIOLO->GetBusiness('common','setor', $item);

    $navbar->AddOption(ucwords(strtolower($objSetor->sigla)), 'common', 'main:setor',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmSetor', $objSetor,'setor');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
