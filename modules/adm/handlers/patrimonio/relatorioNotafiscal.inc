<?php
// 08/05/2013 - Eder PSA
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório de Notas Fiscais', 'adm', 'main:patrimonio:RelatorioNotafiscal');
$form = $MIOLO->GetUI()->GetForm($module,'frmRelatorioNotaFiscal', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
