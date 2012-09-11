<?
    /**
     * Adm Module - Liquidacao Handler
     * Handler Liquidacao do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objLiquidacao = $MIOLO->GetBusiness('adm','liquidacao', $item);

    $navbar->AddOption($objLiquidacao->idLiquidacao, 'adm', 'main:liquidacao:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmLiquidacao', $objLiquidacao, 'liquidacao');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
