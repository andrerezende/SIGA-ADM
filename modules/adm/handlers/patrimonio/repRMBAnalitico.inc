<?php
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório Analítico de Movimento de Bens', 'adm', 'main:patrimonio:repRMBAnalitico');
$form = $MIOLO->GetUI()->GetForm($module,'frmRepRMBAnalitico', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>