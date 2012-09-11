<?
    // permissões
    $perms->CheckAccess('PROT_USR',A_ACCESS,true);
    
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    // barra de navegação
    $navbar->AddOption('Entrada Múltipla', 'protocolo', 'main:multiplos:entrada',$item);

    // insere o formulário frmProcesso
    $form = $MIOLO->GetUI()->GetForm($module,'frmMultiplosEntrada','','multiplos');
    $theme->InsertContent($form);

    // invoca o handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
