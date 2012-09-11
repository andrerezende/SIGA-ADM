<?
    // permissões
    $perms->CheckAccess('PROT_USR',A_ACCESS,true);
    
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    // barra de navegação
    $navbar->AddOption('Saida Múltipla', 'protocolo', 'main:multiplos:saida',$item);

    // insere o formulário frmProcesso
    $form = $MIOLO->GetUI()->GetForm($module,'frmMultiplosSaida','','multiplos');
    $theme->InsertContent($form);

    // invoca o handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
