<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $obj = $MIOLO->GetBusiness('common','tabelageral', $item);

    $navbar->AddOption(ucwords(strtolower($obj->tabela)), 'common', 'main:tabelageral:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmTabelageral', $obj,'tabelageral');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'find';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>