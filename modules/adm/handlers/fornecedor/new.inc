<?php
if ($perms->CheckAccess('adm', A_ACCESS, true)) {
	$theme->ClearContent();
}

$navbar->AddOption('Novo Fornecedor', $module, 'main:fornecedor:new');

$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module, 'frmFornecedorNew', null, 'fornecedor');
$theme->InsertContent($form);