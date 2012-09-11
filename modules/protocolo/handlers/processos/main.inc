<?
    // permissões
    $perms->CheckAccess('PROT_USR',A_ACCESS,'');
    
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    // instancia o objeto processo
    $objProcesso = $MIOLO->GetBusiness('protocolo','processo',$item);
    
    // barra de navegação
    $navbar->AddOption(ucwords(strtolower($objProcesso->numProcessoFormatado())), 'protocolo', 'main:processos:main',$item);

    // insere o formulário frmProcesso
    $form = $MIOLO->GetUI()->GetForm($module,'frmProcesso',$objProcesso,'processos');
    $theme->InsertContent($form);
    // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');

    // invoca o handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
