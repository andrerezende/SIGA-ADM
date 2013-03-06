<?php
// variáveis
$theme->ClearContent();
$ui = $MIOLO->GetUI();

// insere formulário frmProcessosFind
$form = $ui->GetForm($module,'frmProcessosFindAvacada',NULL,'processos');
$theme->InsertContent($form);