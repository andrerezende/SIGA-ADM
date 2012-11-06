<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$objPedido = $MIOLO->GetBusiness('adm', 'pedidocompra', $item);
$navbar->AddOption('Nova Solicitação', 'adm', 'main:pedidocompra:new');
$form = $ui->GetForm('adm', 'frmPedidoNew', $objPedido, 'pedidocompra');
$theme->InsertContent($form);