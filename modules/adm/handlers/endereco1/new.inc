<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Novo Endereco', 'adm', 'main:endereco:new');
$form = $ui->GetForm('adm','frmEnderecoNew',NULL,'endereco');
$theme->InsertContent($form);