<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Pesquisar Nota Fiscal', 'adm', 'main:notafiscal:find');
$form = $ui->GetForm('adm','frmNotaFiscalFind',NULL,'patrimonio');
$theme->InsertContent($form);