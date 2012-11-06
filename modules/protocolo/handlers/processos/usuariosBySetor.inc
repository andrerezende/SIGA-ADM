<?php
// 22/09/2011 Daniel Bonfim
$theme->ClearContent();
$navbar->AddOption('Relatório de Usuários Por Setor', 'adm', 'main:patrimonio:usuariosBySetor');
$form = $MIOLO->GetUI()->GetForm('protocolo', 'frmRepUsuariosBySetor', '', 'processos');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module, $a);