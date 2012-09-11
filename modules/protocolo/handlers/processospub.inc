<?

    include_once($MIOLO->GetConf('home.modules').'/main_menu.inc');
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    // barra de navegação
    //$navbar->AddOption('Abertura Múltipla', 'protocolo', 'main:multiplos:abertura',$item);

    // insere o formulário frmProcesso
    $form = $MIOLO->GetUI()->GetForm($module,'frmProcessoAcessoPublico','','');
    $theme->InsertContent($form);

    // invoca o handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
