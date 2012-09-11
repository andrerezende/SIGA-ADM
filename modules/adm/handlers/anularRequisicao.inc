<?
    /**
     * Adm Module - Requisicao Handler
     * Handler Uo do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
     		/**
		     * Verifica a exist~encia de um _ 
		     * que indica que estamos deletando um item
		     */
		    if (strstr($item,"_"))
		    {
		    	$arrayStr = split("_",$item);
		    	$idMaterial = $arrayStr[0];
		    	$idRequisicao = $arrayStr[1];
		    }
		    else 
		    {
		    	$idMaterial = 0;
		    	$idRequisicao = $item;
		    }
    
	   
    $objRequisicao = $MIOLO->GetBusiness('adm','requisicao', $idRequisicao);
    
    $navbar->AddOption("Licitações",$module,"main:listarLicitacoes:itens");
    $navbar->AddOption("Anular: " . $objRequisicao->idRequisicao, 'adm', 'main:requisicoes:main');
    
    $form = $MIOLO->GetUI()->GetForm($module,'frmAnularRequisicao', array($objRequisicao,$idMaterial), 'requisicoes');
    
    $theme->InsertContent($form);

?>