<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Novo vida útil', 'adm', 'main:vidautil:new');
$form = $ui->GetForm('adm','frmVidaUtilNew',NULL,'patrimonio');
$theme->InsertContent($form);