<?php
if ($perms->CheckAccess('adm', A_ACCESS, true)) {
	$theme->ClearContent();
}

$objfornecedor = $MIOLO->GetBusiness($module, 'fornecedor', $item);
$navbar->AddOption($objfornecedor->nome, $module, 'main:fornecedor:main');

$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module, 'frmFornecedorFind', $objfornecedor, 'fornecedor');

$theme->InsertContent($form);

$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module, $a);