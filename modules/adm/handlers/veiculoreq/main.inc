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
    $objRequisicao = $MIOLO->GetBusiness('adm','requisicao', $item);
    //$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
    $navbar->AddOption($objRequisicao->idRequisicao, 'adm', 'main:veiculoreq:main');
    
    
    //$form = $MIOLO->GetUI()->GetForm($module,'frmRequisicao', $objRequisicao, 'requisicoes');
     $form = $MIOLO->GetUI()->GetForm($module,'frmRequisicao', $objRequisicao, 'requisicaoveiculo');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
