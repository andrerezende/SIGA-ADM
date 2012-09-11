<?php
// variáveis
$theme->ClearContent();
$ui = $MIOLO->GetUI();

// insere formulário frmProcessosFind
$form = $ui->GetForm($module,'frmProcessosFindAdvanced',NULL,'processos');
$theme->InsertContent($form);