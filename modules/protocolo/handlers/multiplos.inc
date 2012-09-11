<?php
    /**
    * Configuração Handler of PROT Module
    * Handler de Configuração do módulo de protocolo
    * @package br.org.miolo.ufjf.protocolo
    */
    
    /**
    * Permissões necessárias
    *    PROT
    */

    $perms->CheckAccess('PROT_USR',A_ACCESS,true);
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Processos Múltiplos','protocolo','main:multiplos');
    $close = $MIOLO->GetActionURL($module,'main');

    $action = $context->ShiftAction();
    switch($action)
    {
        case 'entrada':
            $MIOLO->InvokeHandler($module, 'multiplos/entrada');
        break;
        case 'decisao':
            $MIOLO->InvokeHandler($module, 'multiplos/decisao');
        break;
        case 'saida':
            $MIOLO->InvokeHandler($module, 'multiplos/saida');
        break;
        case 'abertura':
            $MIOLO->InvokeHandler($module, 'multiplos/abertura');
        break;
        case 'aberturaprint':
            $MIOLO->InvokeHandler($module, 'multiplos/aberturaprint');
        break;
        case 'arquivamento':
            $MIOLO->InvokeHandler($module, 'multiplos/arquivamento');
        break;
        default:
            $panel = new ActionPanel('pnlAdTables','Processos Múltiplos','',$close);
            $panel->SetIconType('large');
         //   $panel->AddUserAction('PROT_ADMIN',A_EXECUTE,'Abertura múltipla',$ui->GetImageTheme('','icons/abertura_multipla.png'),$module,'main:multiplos:abertura');
            $panel->AddUserAction('PROT_USR',A_EXECUTE,'Entrada múltipla',$ui->GetImageTheme('','icons/entrada_multipla.png'),$module,'main:multiplos:entrada');
            $panel->AddUserAction('PROT_USR',A_EXECUTE,'Decisão múltipla',$ui->GetImageTheme('','icons/decisao_multipla.png'),$module,'main:multiplos:decisao');
            $panel->AddUserAction('PROT_USR',A_EXECUTE,'Saída múltipla',$ui->GetImageTheme('','icons/saida_multipla.png'),$module,'main:multiplos:saida');
            $panel->AddUserAction('PROT_USR',A_EXECUTE,'Arquivamento múltiplo',$ui->GetImageTheme('','icons/arquivamento_multiplo.png'),$module,'main:multiplos:arquivamento');
            $theme->AppendContent($panel);
    }
?>
