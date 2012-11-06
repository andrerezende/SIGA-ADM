<?php
// 12/05/2011 Daniel Bonfim
$theme->ClearContent();
$navbar->AddOption('Relatório de Processo', 'adm', 'main:patrimonio:repIRPF');
$form = $MIOLO->GetUI()->GetForm('protocolo', 'frmRepIRPF', '', 'processos');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module, $a);