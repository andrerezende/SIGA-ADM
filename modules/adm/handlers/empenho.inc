<?
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Financeiro','adm','main:financeiro');
    $navbar->AddOption('Empenho','adm','main:empenho:find');
    $handled = $MIOLO->InvokeHandler($module,'empenho/' . $context->shiftAction() );
    /*if ( !$handled )
    {
        $close = $MIOLO->GetActionURL($module,'main');
        $panel = new ActionPanel('panelEmpenho','Opções de Empenho','',$close);
        $panel->SetIconType('small');
	    $panel->AddUserAction('adm_empenho',A_EXECUTE,'Numerar Empenho',$ui->GetImage('','default.png'),$module,'main:empenho:find');
        //$panel->AddUserAction('adm_empenho',A_EXECUTE,'Entrega de Material',$ui->GetImage('','default.png'),$module,'main:empenho:entregamaterialfind');
	    $theme->AppendContent($panel);
    }*/
?>
