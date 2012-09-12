<?php
ob_start();

require_once 'config/config.php';
require_once 'classes/DataHelper.php';
require_once 'classes/dompdf/dompdf_config.inc.php';
require_once 'classes/RmaSubelemento.php';

$dataHelper = new DataHelper();

$mesAnoRef = '01/01/2009';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'dompdf_');

// Url utilizada no link de impressão do relatório.
$url = 'relatorios_pdf/print_pdf.php?input_file=' .
		rawurlencode($tmpFile) . '&paper=letter&output_file=' .
		rawurlencode(pathinfo(basename(__FILE__), PATHINFO_FILENAME) . '.pdf') . '&base_path=http://' . $_SERVER['HTTP_HOST'] . '/relatorios_pdf';

//$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . '/relatorios/statics/';
$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . '/statics/';

$rmbSubelemento = new RmaSubelemento();

$result = $rmbSubelemento->geraRelatorio(array('mesAnoRef' => $mesAnoRef));
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
					<p class="titulo-relatorio">RELATÓRIO DE MOVIMENTO DE BENS CONSOLIDADO</p>
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
				</tr>
				<?php debug($result);?>
				<tr>
					<th class="descricao">Total</th>
					<th class="totais valores"></th>
					<th class="totais valores"></th>
					<th class="totais valores"></th>
					<th class="totais valores"></th>
				</tr>
			</table>
		</div>
	</body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents());?>