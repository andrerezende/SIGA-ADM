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
    $ui = $MIOLO->GetUI();
    $objUo = $MIOLO->GetBusiness('adm','uo', $item);
    $navbar->AddOption($objUo->sigla, 'adm', 'main:uo:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmUo', $objUo, 'uo');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
