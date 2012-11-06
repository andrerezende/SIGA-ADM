<?php
// 14-11-2011 - Daniel Bonfim
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório de Movimento por Nota Fiscal', 'adm', 'main:patrimonio:repMovimentacaoNotaFiscal');
$form = $MIOLO->GetUI()->GetForm($module,'frmRepMovimentacaoNotaFiscal', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
