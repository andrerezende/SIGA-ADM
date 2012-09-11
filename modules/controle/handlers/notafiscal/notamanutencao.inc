<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objNotaFiscal = $MIOLO->GetBusiness('controle','notafiscal',$item);
    $navbar->AddOption($objNotaFiscal->idNotaFiscal, 'controle', 'main:notafiscal:find');
    $form = $MIOLO->GetUI()->GetForm($module,'frmNotaFiscalManutencao', $objNotaFiscal, 'notafiscal');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
