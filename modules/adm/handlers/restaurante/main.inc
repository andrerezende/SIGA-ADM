<?
    /**
     * Adm Module - Uo Handler
     * Handler Uo do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $restaurante = $MIOLO->GetUI();
    $objRestaurante = $MIOLO->GetBusiness('adm','restaurante', $item);

    $navbar->AddOption($objRestaurante->nome, 'adm', 'main:restaurante:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmRestaurante', $objRestaurante, 'restaurante');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
