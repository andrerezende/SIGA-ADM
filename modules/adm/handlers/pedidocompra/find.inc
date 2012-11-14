<?php
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Pesquisar Solicitações', 'adm', 'main:pedidocompra:find');
$form = $ui->GetForm('adm','frmPedidosFind',NULL,'pedidocompra');
$theme->InsertContent($form);