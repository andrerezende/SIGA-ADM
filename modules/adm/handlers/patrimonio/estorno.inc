<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Estornar Nota Fiscal', 'adm', 'main:notafiscal:estorno');
$form = $ui->GetForm('adm','frmNotaFiscalEstorno',null,'notafiscal');
$theme->InsertContent($form);