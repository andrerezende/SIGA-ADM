<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objNotaFiscal = $MIOLO->GetBusiness('adm','notafiscalmanutencaoveiculo',$item);

    $navbar->AddOption($objNotaFiscal->idNotaFiscal, 'adm', 'main:notafiscalmanutencaoveiculo:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmNotaFiscal', $objNotaFiscal, 'notafiscalmanutencaoveiculo');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
