<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objEmpresa = $MIOLO->GetBusiness('adm','empresamanutencaoveiculo',$item);

    $navbar->AddOption($objEmpresa->nome, 'empresamanutencaoveiculo', 'main:empresamanutencaoveiculo:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmEmpresa', $objEmpresa, 'empresamanutencaoveiculo');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
