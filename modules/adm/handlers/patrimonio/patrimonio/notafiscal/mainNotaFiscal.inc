<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('NOTA FISCAL', 'adm', 'main:notafiscal:find');
$form = $ui->GetForm('adm','frmNotaFiscal',NULL,'patrimonio');
//$theme->InsertContent($form);