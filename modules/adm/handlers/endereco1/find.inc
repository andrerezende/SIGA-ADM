<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Pesquisar Endereço', 'adm', 'main:endereco:find');
$form = $ui->GetForm('adm','frmEnderecoFind',NULL,'endereco');
$theme->InsertContent($form);