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
    $navbar->AddOption('Requisição '.$objRequisicao->idRequisicao, 'adm', 'main:ordenador:itens');
    $form = $MIOLO->GetUI()->GetForm($module,'frmItensALiberar', $objRequisicao, 'ordenador');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
