<?php

$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Nova Nota Fiscal', 'adm', 'main:notafiscal:new');
$form = $ui->GetForm('adm','frmNotaFiscalNew',NULL,'patrimonio');
$theme->InsertContent($form);
