<?php
$ui = $MIOLO->GetUI();
$navbar->AddOption('Solicitação de Compra', 'adm', 'main:pedidocompra');
$close = $MIOLO->GetActionURL($module, 'main');
$panel = new ActionPanel('pnlAdTables', 'Solicitação de Compra', '', $close);
$panel->SetIconType('large');

$panel->AddUserAction('adm_pedidocompra', A_EXECUTE, 'Solicitação de Compra', $ui->GetImageTheme('', 'icons/itens_patrimoniais.png'), $module, 'main:pedidocompra:new');
$panel->AddUserAction('adm_pedidocompra', A_EXECUTE, 'Pesquisa de Solicitações', $ui->GetImageTheme('', 'icons/itens_patrimoniais.png'), $module, 'main:pedidocompra:find');
$theme->AppendContent($panel);

switch ($action) {
	case 'main:pedidocompra:new':
		$MIOLO->InvokeHandler($module, 'pedidocompra/new');
		break;
	case 'main:pedidocompra:find':
		$MIOLO->InvokeHandler($module, 'pedidocompra/find');
		break;
	default :
		$MIOLO->InvokeHandler($module, 'pedidocompra/main');
}