<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Editar vida útil', 'adm', 'main:vidautil:edit');
$form = $ui->GetForm('adm','frmVidaUtilEdit',$item,'patrimonio');
$theme->InsertContent($form);