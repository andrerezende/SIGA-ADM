<?php
// 11/10/2011 Daniel Bonfim
$theme->ClearContent();
$navbar->AddOption('Relatório de Processos de um setor', 'adm', 'main:patrimonio:processosBySetor');
$form = $MIOLO->GetUI()->GetForm('protocolo', 'frmRepProcessosBySetor', '', 'processos');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module, $a);