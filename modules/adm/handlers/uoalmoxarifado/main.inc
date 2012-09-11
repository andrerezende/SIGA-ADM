<?
    /**
     * ADM Module - Almoxarifado Handler
     * Handler Almoxarifado do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    ADM Manter Cadastro de Almoxarifado
     */
    $perms->CheckAccess('adm',A_ACCESS,true);
    
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $objAlmoxarifado = $MIOLO->GetBusiness('adm','uo', $item);

    $navbar->AddOption(ucwords(strtolower($objAlmoxarifado->nome)), 'adm', 'main:uoalmoxarifado:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmUoAlmoxarifado', $objAlmoxarifado, 'uoalmoxarifado');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
