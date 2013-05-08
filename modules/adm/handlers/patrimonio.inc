<?php

$ui = $MIOLO->GetUI();
$navbar->AddOption('Patrimônio', 'adm', 'main:patrimonio');
$close = $MIOLO->GetActionURL($module, 'main');
$panel = new ActionPanel('pnlAdTables', 'Patrimônio', '', $close);
$panel->SetIconType('large');
$panel2 = new ActionPanel('pnlAdTables', 'Relatórios', '', $close);
$panel2->SetIconType('large');

$panel3 = new ActionPanel('pnlAdTables', 'Relatórios Contábeis', '', $close);
$panel3->SetIconType('large');

$panel4 = new ActionPanel('pnlAdTables', 'Termo de Responsabilidade', '', $close);
$panel4->SetIconType('large');

$panel5 = new ActionPanel('pnlAdTables', 'Relatórios Por Notas Fiscais', '', $close);
$panel5->SetIconType('large');

$perms = $MIOLO->getPerms()->checkAccess('ADM_VIDAUTIL', A_ACCESS);

$panel->AddUserAction('adm_patrimonio', A_EXECUTE, 'Itens Patrimoniais', $ui->GetImageTheme('', 'icons/ItemPatrimonioTag.png'), $module, 'main:itempatrimonio:find');
//  Daniel
$panel->AddUserAction('adm_patrimonio', A_EXECUTE, 'Nota fiscal', $ui->GetImageTheme('', 'icons/NotaFiscal.png'), $module, 'main:notafiscal:find');

if ($perms) {
    //$panel->AddUserAction('adm_patrimonio',A_EXECUTE,'Vida útil', $ui->GetImageTheme('','icons/classificador.png'),$module,'main:vidautil:find');
    $panel->AddAction('Vida útil', $ui->GetImageTheme('', 'icons/classificador.png'), $module, 'main:vidautil:find');
}

//comentado para ser avaliado a necessidade
//$panel->AddUserAction('adm_patrimonio',A_EXECUTE,'Empenhos Anos Anteriores', $ui->GetImageTheme('','default.png'),$module,'main:financeiro:empenho2006');
//$panel->AddUserAction('adm_patrimonio',A_EXECUTE,'Responsabilidade por Empenho', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repTermo');
//linhas implementadas
$panel4->AddUserAction('adm_patrimonio', A_EXECUTE, 'Por Numero', $ui->GetImageTheme('', 'icons/termoNumero.png'), $module, 'main:patrimonio:repTermo2');
$panel4->AddUserAction('adm_patrimonio', A_EXECUTE, 'Por Setor', $ui->GetImageTheme('', 'icons/termoResponsabilidade.png'), $module, 'main:patrimonio:repIPorSetor');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Balancete', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repBalancete');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Aquisições no Período', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repAquisicoesPorPeriodo');
$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Lista de Itens', $ui->GetImageTheme('','icons/Patrimonio.png'),$module,'main:patrimonio:repItensPatrimonio');
$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Lista de Itens Estornados', $ui->GetImageTheme('','icons/PatrimonioEstorno.png'),$module,'main:patrimonio:repItensEstornados');
$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Lista de Notas Fiscais', $ui->GetImageTheme('','icons/ResumoPorUO.png'),$module,'main:patrimonio:repNotaFiscal');
$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Lista de Contas Contábeis', $ui->GetImageTheme('','icons/ListadeMateriais.png'),$module,'main:patrimonio:repVidaUtil');
$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Aquisições por Setor', $ui->GetImageTheme('','icons/Aquisicao.png'),$module,'main:patrimonio:repAquisicoesPorSetorPeriodo');

//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Itens por Empenho', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repItensPorEmpenho');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Itens por Setor', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repItensPorSetor');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Itens por Classificador', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repItensPorClassificador');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Totais por Classificador', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repTotaisPorClassificador');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Totais por Classificador no Período', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repTotaisPorClassificadorPeriodo');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Totais por Setor', $ui->GetImageTheme('adm','icons/relatorio.png'),$module,'main:patrimonio:repTotaisPorSetor');
$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Baixas por Instituição', $ui->GetImageTheme('', 'icons/BaixasPeriodo.png'), $module, 'main:patrimonio:repBaixasPorPeriodo');
//$panel2->AddUserAction('adm_patrimonio',A_EXECUTE,'Classificador por Elemento de Despesa', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repClassificadorPorElemento');
//19/10/2010 - Vitor Pacheco
$panel3->AddUserAction('adm_patrimonio', A_EXECUTE, 'Depreciação por Conta Contábil', $ui->GetImageTheme('', 'icons/depreciacao02.png'), $module, 'main:patrimonio:repDepreciacaoPorContaContabil');
$panel3->AddUserAction('adm_patrimonio', A_EXECUTE, 'Depreciação por Item', $ui->GetImageTheme('', 'icons/depreciacao01.png'), $module, 'main:patrimonio:repDepreciacaoPorItem');

//$panel3->AddUserAction('adm_patrimonio', A_EXECUTE, 'Movimentação de Bens', $ui->GetImageTheme('','icons/MovPorNotaFiscal.png'),$module,'main:patrimonio:repRMB');
//daniel


$panel3->AddUserAction('adm_patrimonio', A_EXECUTE, 'RMB', $ui->GetImageTheme('', 'icons/MovPorSubelemento.png'), $module, 'main:patrimonio:repRMBConsolidado');
// 13-11-2011 - Daniel Bonfim
//$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Relatório de Movimentação por Subelemento', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repMovimentacaoSubelemento');
// 14-11-2011 - Daniel Bonfim
//$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Relatório de Movimentação Nota Fiscal', $ui->GetImageTheme('','icons/relatorio.png'),$module,'main:patrimonio:repMovimentacaoNotaFiscal');
//$panel2->addUserAction('adm_patrimonio', A_EXECUTE, 'Itens patrimoniais estornados', $ui->GetImageTheme('','icons/relatorio.png'), $module, 'main:patrimonio:repItensEstornados');

$panel2->AddUserAction('adm_patrimonio', A_EXECUTE, 'Transferências de Itens', $ui->GetImageTheme('', 'icons/PatrimonioTransferencia.png'), $module, 'main:patrimonio:repItensTransferencia');
$panel5->AddUserAction('adm_patrimonio', A_EXECUTE, 'Relatório Por Noata Fiscal', $ui->GetImageTheme('', 'icons/PatrimonioTransferencia.png'), $module, 'main:patrimonio:replatorioNotaFiscal');

$theme->AppendContent($panel);
$theme->AppendContent($panel4);
$theme->AppendContent($panel2);
$theme->AppendContent($panel3);
$theme->AppendContent($panel5);
$theme->AppendContent(new MSpacer(1));
$action = $context->ShiftAction();
switch ($action) {
    case 'repTermo':
        $MIOLO->InvokeHandler($module, 'patrimonio/repTermo');
        break;
    case 'repItensTransferencia':
        $MIOLO->InvokeHandler($module, 'patrimonio/repItensTransferencia');
        break;
    case 'replatorioNotaFiscal':
        $MIOLO->InvokeHandler($module, 'patrimonio/relatorioNotafiscal');
        break;
    case 'repItensEstornados':
        $MIOLO->InvokeHandler($module, 'patrimonio/repItensEstornados');
        break;
    case 'repBalancete':
        $MIOLO->InvokeHandler($module, 'patrimonio/repBalancete');
        break;
    case 'repAquisicoesPorPeriodo':
        $MIOLO->InvokeHandler($module, 'patrimonio/repAquisicoesPorPeriodo');
        break;
    case 'repAquisicoesPorSetorPeriodo':
        $MIOLO->InvokeHandler($module, 'patrimonio/repAquisicoesPorSetorPeriodo');
        break;
    case 'repItensPorEmpenho':
        $MIOLO->InvokeHandler($module, 'patrimonio/repItensPorEmpenho');
        break;
    case 'repIPorSetor':
        $MIOLO->InvokeHandler($module, 'patrimonio/repIPorSetor');
        break;
    case 'repItensPorSetor':
        $MIOLO->InvokeHandler($module, 'patrimonio/repItensPorSetor');
        break;
    case 'repItensPorClassificador':
        $MIOLO->InvokeHandler($module, 'patrimonio/repItensPorClassificador');
        break;
    case 'repTotaisPorClassificador':
        $MIOLO->InvokeHandler($module, 'patrimonio/repTotaisPorClassificador');
        break;
    case 'repTotaisPorClassificadorPeriodo':
        $MIOLO->InvokeHandler($module, 'patrimonio/repTotaisPorClassificadorPeriodo');
        break;
//	case 'repTotaisPorSetor':
//		$MIOLO->InvokeHandler($module, 'patrimonio/repTotaisPorSetor');
//		break;
    case 'repBaixasPorPeriodo':
        $MIOLO->InvokeHandler($module, 'patrimonio/repBaixasPorPeriodo');
        break;
    case 'repClassificadorPorElemento':
        $MIOLO->InvokeHandler($module, 'patrimonio/repClassificadorPorElemento');
        break;
    case 'repTermo2':
        $MIOLO->InvokeHandler($module, 'patrimonio/repTermo2');
        break;
//	19/10/2010 - Vitor Pacheco
    case 'repDepreciacaoPorContaContabil':
        $MIOLO->InvokeHandler($module, 'patrimonio/repDepreciacaoPorContaContabil');
        break;
    case 'repDepreciacaoPorItem':
        $MIOLO->InvokeHandler($module, 'patrimonio/repDepreciacaoPorItem');
        break;
    case 'repItensPatrimonio';
        $MIOLO->InvokeHandler($module, 'patrimonio/repItensPatrimonio');
        break;
    case 'repRMB';
        $MIOLO->InvokeHandler($module, 'patrimonio/repRMB');
        break;
//	daniel
    case 'repNotaFiscal';
        $MIOLO->InvokeHandler($module, 'patrimonio/repNotaFiscal');
        break;
    case 'repVidaUtil';
		$MIOLO->InvokeHandler($module, 'patrimonio/repVidaUtil');
        break;
    case 'repRMBConsolidado';
        $MIOLO->InvokeHandler($module, 'patrimonio/repRMBConsolidado');
        break;
    // 13-11-2011 - Daniel Bonfim
    case 'repMovimentacaoSubelemento';
        $MIOLO->InvokeHandler($module, 'patrimonio/repMovimentacaoSubelemento');
        break;
    // 14-11-2011 - Daniel Bonfim
    case 'repMovimentacaoNotaFiscal';
        $MIOLO->InvokeHandler($module, 'patrimonio/repMovimentacaoNotaFiscal');
        break;
}
?>
