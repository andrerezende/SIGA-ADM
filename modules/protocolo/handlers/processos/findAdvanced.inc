<?php
// variáveis
$theme->ClearContent();
$ui = $MIOLO->GetUI();

// insere formulário frmProcessosFind
$form = $ui->GetForm($module,'frmProcessoNovo',NULL,'processos');
$theme->InsertContent($form);