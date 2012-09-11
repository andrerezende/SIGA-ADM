<?
    $perms->CheckAccess('ORGANOGRAMA',A_ACCESS,true);
    
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $objOrganograma = $MIOLO->GetBusiness('common','tipoorganograma', $item);

    $navbar->AddOption(ucwords(strtolower($objOrganograma->sigla)), 'common', 'main:organograma',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmOrganograma', $objOrganograma,'organograma');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
