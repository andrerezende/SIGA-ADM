<?php
if ($perms->CheckAccess('adm', A_ACCESS, true)) {
	$theme->ClearContent();
}

$objFornecedor = $MIOLO->GetBusiness($module, 'fornecedor', $item);
$navbar->AddOption($objFornecedor->nome, $module, 'main:fornecedor:edit');

$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module, 'frmFornecedorEdit', $objFornecedor, 'fornecedor');
$theme->InsertContent($form);