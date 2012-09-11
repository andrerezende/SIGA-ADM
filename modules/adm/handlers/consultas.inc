<?php
    /**
     * Configuração Handler of Adm Module
     * Handler de Configuração do módulo de Administração 
     * @package br.org.miolo.ufjf.rh
     */
    
    /**
     * Permissões necessárias
     *    RH
     */

    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Consultas','adm','main:consultas');
    $close = $MIOLO->GetActionURL($module,'main');
    $panel = new ActionPanel('pnlAdTables','Consultas','',$close);
    $panel->SetIconType('large');
    $panel->AddAction('Material',$ui->GetImageTheme('','icons/material.png'),  $module,'main:material:find');
    $panel->AddAction('Serviço',$ui->GetImageTheme('','icons/servico.png'),  $module,'main:servicoext:find');
    $panel->AddAction('Solitação de Cadastro de Materiais',$ui->GetImageTheme('','icons/material_novo.png'),$module,'main:novomaterial:find');
    //A consulta de novos serviços está funcionando (descomentar para ativar)
	//$panel->AddAction('Novo Servico',$ui->GetImageTheme('','default.png'),$module,'main:novoservico:find');
    $theme->AppendContent($panel);
?>

