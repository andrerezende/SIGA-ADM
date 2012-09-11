<?php
// 19/10/2010 - Vitor Pacheco
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório de Movimento de Bens', 'adm', 'main:patrimonio:repRMB');
$form = $MIOLO->GetUI()->GetForm($module,'frmRepRMB', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
