<?
    // permissões
    $perms->CheckAccess('PROT_CONF',A_SYSTEM,true);
    
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    // instancia o objeto processo
    $objSetor = $MIOLO->GetBusiness('protocolo','setor',$item);
    
    // barra de navegação
    $navbar->AddOption(ucwords(strtolower($objSetor->sigla)), 'protocolo', 'main:setor:main',$item);

    // insere o formulário frmProcesso
    $form = $MIOLO->GetUI()->GetForm($module,'frmSetor',$objSetor,'setor');
    $theme->InsertContent($form);

    // invoca o handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
