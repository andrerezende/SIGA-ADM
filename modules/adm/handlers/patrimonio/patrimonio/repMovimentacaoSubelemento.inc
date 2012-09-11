<?php
// 13-11-2011 - Daniel Bonfim
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório de Movimento por Subelemento', 'adm', 'main:patrimonio:repMovimentacaoSubelemento');
$form = $MIOLO->GetUI()->GetForm($module,'frmRepMovimentacaoSubelemento', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
