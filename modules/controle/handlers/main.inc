<?php
    $navbar->AddOption('Módulo de Controle','controle','main');
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
    if (!$handled)
    {
        $close = $MIOLO->GetActionURL('common','main');
        $panel = new ActionPanel('pnlControle','Controle','',$close);
        $panel->AddUserAction('',A_EXECUTE,'Controle de Veículos',$ui->GetImage('controle','kcontrol.png'),$module,'main:manutencaoveiculo');
        $theme->AppendContent($panel);
    } 
?>
