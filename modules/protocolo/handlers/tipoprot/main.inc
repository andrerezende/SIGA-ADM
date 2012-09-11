<?
    // permissões   
    
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    // instancia o objeto processo
    $objTipoProt = $MIOLO->GetBusiness('protocolo','tipoprot',$item);
    
    // barra de navegação
    $navbar->AddOption(strtoupper($objTipoProt->tipo), 'protocolo', 'main:tipoprot:main',$item);

    $form = $MIOLO->GetUI()->GetForm('protocolo','frmTipoprot',$objTipoProt,'tipoprot');
    $theme->InsertContent($form);

    // invoca o handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>