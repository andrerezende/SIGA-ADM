<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Editar Endereco', 'adm', 'main:endereco:edit');
$form = $ui->GetForm('adm','frmEnderecoEdit',$item,'endereco');
$theme->InsertContent($form);