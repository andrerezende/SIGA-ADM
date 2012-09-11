<?php
    /**
     * Configuração Handler of Adm Module
     * Handler de Configuração do módulo de Administração 
     * @package br.org.miolo.ufjf.rh
     */
    
    /**
     * Permissões necessárias
     *    AD
     */

    $ui = $MIOLO->GetUI();
    //$navbar->AddOption('Administração',$module,'main');
    $navbar->AddOption('Recursos',$module,'main:recursos');
    $close = $MIOLO->GetActionURL($module,'main');
	$panel = new ActionPanel('pnlAdTables','Recursos','',$close);
    $panel->AddUserAction('adm_recursos',A_EXECUTE,'Saldo',$ui->GetImageTheme('','icons/saldo.png'),$module,'main:recursos:saldo');
    $panel->AddUserAction('adm_gestoruo',A_EXECUTE,'Requisitantes',$ui->GetImageTheme('','icons/requisitantes.png'),$module,'main:uoacesso');

	// Removido Até a correção dos mesmos
    //$panel->AddUserAction('adm_recursos',A_EXECUTE,'Imprimir Requisição',$ui->GetImageTheme('','icons/imprimir_requisicao.png'),$module, 'main:recursos:imprimirreq');
    //
	//$panel->AddUserAction('adm_gestoruo',A_EXECUTE,'Relatório Financeiro',$ui->GetImageTheme('','icons/relatorio_financeiro.png'),$module, 'main:recursos:relatfinanc');
	    
	$theme->AppendContent($panel);

	$handled = $MIOLO->InvokeHandler($module, 'recursos/' . $context->ShiftAction());
?>
