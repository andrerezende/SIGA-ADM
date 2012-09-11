<?
    /**
    * Configuração Handler of PROT Module
    * Handler de Configuração do módulo de protocolo
    * @package br.org.miolo.ufjf.protocolo
    */
    
    /**
    * Permissões necessárias
    *    PROT
    */

    $perms->CheckAccess('PROT_CONF',A_ACCESS,true);
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Configurações','protocolo','main:configuracao');
    $close = $MIOLO->GetActionURL($module,'main');

    $panel = new ActionPanel('pnlAdTables','Configurações do Sistema','',$close);
    $panel->SetIconType('small');
    $panel->AddUserAction('PROT_CONF',A_EXECUTE,'Setor',$ui->GetImage('protocolo','setor_mini.png'),$module,'main:setor:find');
    $panel->AddUserAction('PROT_CONF',A_EXECUTE,'Tipos Protocolados',$ui->GetImage('protocolo','setor_mini.png'),$module,'main:tipoprot:find');
    $theme->AppendContent($panel);
    // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
?>

