<?php
ob_start();

require_once 'config/config.php';
require_once 'classes/DataHelper.php';
require_once 'classes/dompdf/dompdf_config.inc.php';
require_once 'classes/RmbAnalitico.php';

$dataHelper = new DataHelper();

$mesAnoRef = substr($_GET['ref'], 0, 10);
$ids = substr($_GET['ref'], 11);

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'dompdf_');

// Url utilizada no link de impressão do relatório.
$url = 'relatorios_pdf/print_pdf.php?input_file=' .
		rawurlencode($tmpFile) . '&paper=letter&output_file=' .
		rawurlencode(pathinfo(basename(__FILE__), PATHINFO_FILENAME) . '.pdf') . '&base_path=http://' . $_SERVER['HTTP_HOST'] . '/relatorios_pdf';

$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . '/relatorios/statics/';
$rmbConsolidado = new RmbAnalitico();

$nomesInstituicoes = $rmbConsolidado->getNomesInstituicoes(array('mesAnoRef' => $mesAnoRef, 'idsRef' => $ids));
$result = $rmbConsolidado->geraRelatorio(array('mesAnoRef' => $mesAnoRef, 'idsRef' => $ids));

//$nomesInstituicoes = $rmbConsolidado->getNomesInstituicoes();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="<?php echo $baseURL;?>css/estilo.css" />
		<!-- Alterar título do Relatóio aqui -->
		<title>Relatórios :: Movimento de Bens Consolidado</title>
	</head>
	<body>
		<div id="conteudo">
			<!-- Início topo do Relatório, não alterar -->
			<div id="topo-mec">
				<a href="http://portal.mec.gov.br/" class="img-mec"><img alt="Ministerio da Educação" src="<?php echo $baseURL;?>img/h1pq.gif" /></a>
				<a href="http://www.brasil.gov.br/" class="img-selo"><img alt="Portal do Governo" src="<?php echo $baseURL;?>img/selo_brasil_pq.gif" /></a>
			</div>
			<div id="topo-geral">
				<div id="topo">
					<span class="titulo">SIGA - Sistema Integrado de Gestão Acadêmica</span>
				</div>
			</div>
			<div id="menu">
				<a href="<?php echo $url;?>">Imprimir Relatório <img src="<?php echo $baseURL;?>img/action_print.gif" alt="Imprimir Relatório" /></a>
			</div>
			<!-- Fim topo do Relatório -->
			<div id="topo-relatorio">
				<div id="cabecalho-relatorio">
					<p class="data-hora"><?php echo $dataHelper->dataCompleta(time());?></p>
					<!-- Alterar título do Relatóio aqui -->
					<p class="titulo-relatorio">
						MINISTÉRIO DA EDUCAÇÃO
						<br />
						SECRETARIA DE EDUCAÇÃO PROFISSIONAL E TECNOLÓGICA
						<br />
						INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA BAIANO
					</p>
					<p class="titulo-relatorio">RELATÓRIO ANALÍTICO DE MOVIMENTO DE BENS</p>
					<p>Instituições: <?php echo $nomesInstituicoes;?></p>
					<p>Mês-Ano Referência: <?php echo $dataHelper->mesAno($mesAnoRef);?></p>
				</div>
			</div>
			<table>
				<tr>
					<th class="descricao">Conta Contábil</th>
					<th class="valores">Saldo Anterior (R$)</th>
					<th class="valores">Entrada (R$)</th>
					<th class="valores">Saída (R$)</th>
					<th class="valores">Saldo (R$)</th>
                                        <th class="valores">Cód. Item</th>
                                        <th class="descricao">Item</th>
                                        <th class="vdata">LANÇAMENTO</th>
                                        <th class="valores">Nº DA NOTA FISCAL</th>
                                        <th class="data">DATA DA NOTA FISCAL</th>
                                        <th class="valores">CNPJ</th>
                                        <th class="valores">ATESTE</th>
                                        
				</tr>
				<?php
				$tamanho = count($result);
				$j = 0;
				for ($i = 0; $i <= $tamanho; $i++) {
                                    
					if ($i == 0 && $result[$i]->idvidautil == $result[$i+1]->idvidautil) {
						$vidautil_descricao[$j] = '<b>' . $result[$i]->idvidautil . '</b> - ' . $result[$i]->descricao;
						$total_vidautil_saldo_anterior[$j] += $result[$i]->saldo_anterior;
						$total_vidautil_entrada[$j] += $result[$i]->entrada;
						$total_vidautil_saida[$j] += $result[$i]->saida;
						$total_vidautil_saldo[$j] += ($result[$i]->saldo_anterior + $result[$i]->entrada) - $result[$i]->saida;
                                                $item_patri_codigo[$j] = $result[$i]->iditempatrimonio;
                                                $item_patri_descricao[$j] = $result[$i]->itemdescricao;
                                                $item_patri_dataaquisicao[$j] = $result[$i]->dataaquisicao;
                                                $nota_notafiscal[$j] = $result[$i]->notafiscal;
                                                $nota_data[$j] = $result[$i]->datanotafiscal;
                                                $nota_cnpj[$j] = $result[$i]->cnpj;
                                                $nota_dataateste[$j] = $result[$i]->dataateste;
					} else if ($i > 0 && $result[$i-1]->idvidautil == $result[$i]->idvidautil) {
						$vidautil_descricao[$j] = '<b>' . $result[$i]->idvidautil . '</b> - ' . $result[$i]->descricao;
						$total_vidautil_saldo_anterior[$j] += $result[$i]->saldo_anterior;
						$total_vidautil_entrada[$j] += $result[$i]->entrada;
						$total_vidautil_saida[$j] += $result[$i]->saida;
						$total_vidautil_saldo[$j] += ($result[$i]->saldo_anterior + $result[$i]->entrada) - $result[$i]->saida;
                                                $item_patri_codigo[$j] = $result[$i]->iditempatrimonio;
                                                $item_patri_descricao[$j] = $result[$i]->itemdescricao;
                                                $item_patri_dataaquisicao[$j] = $result[$i]->dataaquisicao;
                                                $nota_notafiscal[$j] = $result[$i]->notafiscal;
                                                $nota_data[$j] = $result[$i]->datanotafiscal;
                                                $nota_cnpj[$j] = $result[$i]->cnpj;
                                                $nota_dataateste[$j] = $result[$i]->dataateste;
					} else {
						$j++;
						$vidautil_descricao[$j] = '<b>' . $result[$i]->idvidautil . '</b> - ' . $result[$i]->descricao;
						$total_vidautil_saldo_anterior[$j] += $result[$i]->saldo_anterior;
						$total_vidautil_entrada[$j] += $result[$i]->entrada;
						$total_vidautil_saida[$j] += $result[$i]->saida;
						$total_vidautil_saldo[$j] += ($result[$i]->saldo_anterior + $result[$i]->entrada) - $result[$i]->saida;
                                                $item_patri_codigo[$j] = $result[$i]->iditempatrimonio;
                                                $item_patri_descricao[$j] = $result[$i]->itemdescricao;
                                                $item_patri_dataaquisicao[$j] = $result[$i]->dataaquisicao;
                                                $nota_notafiscal[$j] = $result[$i]->notafiscal;
                                                $nota_data[$j] = $result[$i]->datanotafiscal;
                                                $nota_cnpj[$j] = $result[$i]->cnpj;
                                                $nota_dataateste[$j] = $result[$i]->dataateste;
					}
				} 
				for ($i = 1; $i < $j; $i++) :?>
					<tr> 
						<td class="descricao"><?php echo $vidautil_descricao[$i];?></td>
						<td class="valores"><?php echo number_format($total_vidautil_saldo_anterior[$i], 2, ',', '.');?></td>
						<td class="valores"><?php echo number_format($total_vidautil_entrada[$i], 2, ',', '.');?></td>
						<td class="valores"><?php echo number_format($total_vidautil_saida[$i], 2, ',', '.');?></td>
						<td class="valores"><?php echo number_format($total_vidautil_saldo[$i], 2, ',', '.');?></td>
                                                <td class="valores"><?php echo $item_patri_codigo[$i];?></td>
                                                <td class='descricao' style='text-align: center;'><?php echo $item_patri_descricao[$i];?></td>
                                                <td class="data"><?php echo $item_patri_dataaquisicao[$i];?></td>
                                                <td class="valores"><?php echo $nota_notafiscal[$i];?></td>
                                                <td class="data"><?php echo $nota_data[$i];?></td>
                                                <td class="valores"><?php echo $nota_cnpj[$i];?></td>
                                                <td class="data"><?php echo $nota_dataateste[$i];?></td>
					</tr>
				<?php endfor;?>
				<tr>
                                    <table>
                                        <tr>
					<th class="descricao">Total</th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_saldo_anterior), 2, ',', '.');?></th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_entrada), 2, ',', '.');?></th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_saida), 2, ',', '.');?></th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_saldo), 2, ',', '.');?></th>
                                        </tr>
                                    </table>    
				</tr>
			</table>
		</div>
	</body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents());?>
