<?php
// 19/10/2010 - Vitor Pacheco
if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Estornar Nota Fiscal', 'adm', 'main:patrimonio:repMotivoEstorno');
$form = $MIOLO->GetUI()->GetForm($module,'frmMotivoEstorno', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
