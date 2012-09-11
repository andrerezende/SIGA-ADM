<?php
$perms->CheckAccess('ADM', A_ACCESS, true);

$theme->ClearContent();
$ui = $MIOLO->GetUI();

$objPedido = $MIOLO->GetBusiness('adm', 'pedidocompra', $item);

if (isset($item)) {
	$navbar->AddOption('Solicitação de Compra - Número ' . $objPedido->idPedidoCompra, 'adm', 'main:pedidocompra:find', $item);
	$form = $MIOLO->GetUI()->GetForm($module, 'frmPedido', $objPedido, 'pedidocompra');
} else {
	$form = $ui->GetForm('adm', 'frmPedidosFind', NULL, 'pedidocompra');
}
$theme->InsertContent($form);


$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module, $a);