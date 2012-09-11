<?php
if ($perms->CheckAccess('adm', A_ACCESS, true)) {
	$theme->ClearContent();
}

$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module, 'frmFornecedorFind', null, 'fornecedor');

$theme->InsertContent($form);