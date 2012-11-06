<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Pesquisar vida útil', 'adm', 'main:vidautil:find');
$form = $ui->GetForm('adm','frmVidaUtilFind',NULL,'patrimonio');
$theme->InsertContent($form);