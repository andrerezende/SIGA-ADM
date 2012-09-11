<?php
// 19/10/2010 - Vitor Pacheco
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório de Transferência de Itens Patrimoniais', 'adm', 'main:patrimonio:RepItensTransferencia');
$form = $MIOLO->GetUI()->GetForm($module,'frmRepItensTransferencia', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
