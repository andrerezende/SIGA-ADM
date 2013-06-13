<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
//$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
$navbar->AddOption('Editar Endereco', 'adm', 'main:uoveiculo:main');
$form = $ui->GetForm('adm','frmEnderecoEdit',$item,'uoveiculo');
$theme->InsertContent($form);