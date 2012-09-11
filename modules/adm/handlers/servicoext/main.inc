<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objServico = $MIOLO->GetBusiness('adm','servico', $item);//instanciou um objeto servicoext
    $navbar->AddOption($objServico->codServico,'adm','main:servicoext:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmServicoext', $objServico,'servicoext');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?> 
