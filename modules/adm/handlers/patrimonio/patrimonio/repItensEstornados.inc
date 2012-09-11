<?php
// 19/10/2010 - Vitor Pacheco
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório de Itens Estornados', 'adm', 'main:patrimonio:RepItensEstornados');
$form = $MIOLO->GetUI()->GetForm($module,'frmRepItensEstornados', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
