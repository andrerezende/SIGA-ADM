<?
    /**
     * Adm Module - TipoReq Handler
     * Handler TipoReq do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objTipoReq = $MIOLO->GetBusiness('adm','tiporeq', $item);

    $navbar->AddOption($objTipoReq->descricao, 'adm', 'main:tiporeq:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmTipoReq', $objTipoReq, 'tiporeq');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
