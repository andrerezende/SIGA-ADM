<?
/**
 * Handler para manipular dados de um objeto BusinessCommonPessoas
 * @package br.org.miolo.ufjf.rh
 */

    /**
     * Permissões necessárias
     *    RH
     */
    $perms->checkAccess('', A_ACCESS,true);
    
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $objPessoa = $MIOLO->GetBusiness('common','pessoa', $item);

    $navbar->AddOption(ucwords(strtolower($objPessoa->nome)), 'common', 'main:pessoa:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmPessoa', $objPessoa, 'pessoa');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);

?>