<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Editar Nota fiscal', 'adm', 'main:notafiscal:edit');
$form = $ui->GetForm('adm','frmNotaFiscalEdit',$item,'patrimonio');
$theme->InsertContent($form);