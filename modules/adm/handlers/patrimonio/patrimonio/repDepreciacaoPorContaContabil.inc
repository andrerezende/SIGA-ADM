<?php
// 19/10/2010 - Vitor Pacheco
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Valor Depreciado no Período', 'adm', 'main:patrimonio:repDepreciacaoPorContaContabil');
$form = $MIOLO->GetUI()->GetForm($module,'frmRepDepreciacaoPorContaContabil', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
