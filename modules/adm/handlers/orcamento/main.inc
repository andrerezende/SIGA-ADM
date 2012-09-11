<?
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $orcamento = $MIOLO->GetUI();
    $objOrcamentoHist = $MIOLO->GetBusiness('adm','orcamentohist', $item);
    $navbar->AddOption('Lançamento', 'adm', 'main:orcamento:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmOrcamento', $objOrcamentoHist, 'orcamento');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>