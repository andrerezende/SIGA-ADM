<?
// permissões
    $perms->CheckAccess('PROT_USR',A_ACCESS,true);

    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    // barra de navegação
    $navbar->AddOption('Processos Tramitados', 'protocolo', 'main:documentos:processostramitados',$item);

    // insere o formulário frmProcesso
    $form = $MIOLO->GetUI()->GetForm($module,'frmDocumentosProcessosTramitados','','documentos');
    $theme->InsertContent($form);

    // invoca o handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
