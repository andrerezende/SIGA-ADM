<?php
ob_start();

require_once 'config/config.php';
require_once 'classes/DataHelper.php';
require_once 'classes/dompdf/dompdf_config.inc.php';
require_once 'classes/Estoque.php';

$dataHelper = new DataHelper();

$idMaterial = $_GET['idMaterial'];;
$idUO= $_GET['idUO'];
$uo = $_GET['uo'];

GLOBAL $MIOLO;


// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'dompdf_');

// Url utilizada no link de impressão do relatório.
$url = 'relatorios_pdf/print_pdf.php?input_file=' .
		rawurlencode($tmpFile) . '&paper=letter&output_file=' .
		rawurlencode(pathinfo(basename(__FILE__), PATHINFO_FILENAME) . '.pdf') . '&base_path=http://' . $_SERVER['HTTP_HOST'] . '/relatorios_pdf';

$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . '/relatorios/statics/';
$baseURL2 = 'http://' . $_SERVER['HTTP_HOST'];

$css0 = $baseURL2 . '/relatorios2/view/statics/css/estilo3.css';
$css3 = $baseURL2 . '/relatorios2/view/statics/css/demo_table_jui.css';
$css4 = $baseURL2 . '/relatorios2/view/statics/css/jquery-ui-1.8.21.custom.css';


$js1 = $baseURL2 . '/relatorios2/view/statics/js/jquery.js';
$js2 = $baseURL2 . '/relatorios2/view/statics/js/jquery.dataTables.js';
$js3 = $baseURL2 . '/relatorios2/view/statics/js/jquery.dataTables.js';



$params = array('idMaterial' => $idMaterial, 'idUO'=>$idUO);
$estoque = new Estoque();

$results = $estoque->geraRelatorio($params);
$material = $estoque->getMaterial($params);

$quant_total = 0;
$valor_unit_total = 0;
$valor_total = 0;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!--		<link rel="stylesheet" type="text/css" href="<?php echo $baseURL;?>css/estilo.css" />-->
                <link rel="stylesheet" type="text/css" href="<?php echo $css0; ?>" />
		<link rel="stylesheet" type="text/css" href="<?php echo $css3; ?>" />
		<link rel="stylesheet" type="text/css" href="<?php echo $css4; ?>" />
                
                <script type="text/javascript" src="<?php echo $js1 ?>"></script>
		<style type="text/css" media="screen">

			.dataTables_info { padding-top: 0; }
			.dataTables_paginate { padding-top: 0; }
			.css_right { float: right; }
			#tabela_wrapper .fg-toolbar { font-size: 0.8em }
			#theme_links span { float: left; padding: 2px 10px; }

		</style>

		<script type="text/javascript" src="<?php echo $js2 ?>"></script>               
		<script type="text/javascript" charset="utf-8">
			$(document).ready( function() {
				$('#tabela').dataTable( {			
					
					"oLanguage": {

						"sSearch": "Procurar",
						"sLengthMenu": "Mostrar _MENU_ registros por página",
						"sZeroRecords": "Nada encontrado - 0",
						"sInfo": "Mostrando _START_ até _END_ de _TOTAL_ Registros",
						"sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
						"sInfoFiltered": "(Filtrado de _MAX_ registros no total)"
					},
					"bJQueryUI": true,
					"aLengthMenu": [[-1, 10, 25, 50,100,200,500,1000,5000], ['Todos', 10, 25, 50,100,200,500,1000,5000]],
					"iDisplayLength": -1,
					"sPaginationType": "full_numbers",
                                        "aaSorting": [],                                                                                                              
                                        "aoColumnDefs": [{  "sType": "date-uk", "aTargets": [ 0 ]},
                                                         {  "sType": "currency", "aTargets": [ 3 ]},
//                                                         { "bSortable": false, "aTargets": [ 3 ] } ,   
                                                         {  "sType": "formatted-num", "aTargets": [ 4 ]},
                                                         {  "sType": "currency", "aTargets": [ 5 ]} 
//                                                         { "bSortable": false, "aTargets": [ 5 ] } ,
                                        ]
                                        
				} );
			} );
		</script>
                
		<!-- Alterar título do Relatóio aqui -->
		<title>Movimentação do Estoque da <?php echo $uo?></title>
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
<!--				<a href='<?php echo "http://".$_SERVER['HTTP_HOST']."/index.php?module=adm&action=main:uoalmoxarifado&item=$idUO&form=repEstoque"?>'> Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a>-->
<!--				<a href="<?php echo $url;?>">Imprimir Relatório <img src="<?php echo $baseURL;?>img/action_print.gif" alt="Imprimir Relatório" /></a>-->

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
						<br />
						MOVIMENTAÇÃO DE ESTOQUE DA <?php echo $uo?>
					</p>
					<ul>
						<li><span>Material:</span> <?php echo $material->descricao;?></li>
						<li><span>Código:</span> <?php echo $material->codmaterial;?></li>
						<li><span>Unidade:</span> <?php echo $material->unidade;?></li>
						<li><span>Preço Estimado (R$):</span> <?php echo number_format($material->precoestimado, 2, ',', '.');?></li>
						<li><span>Elemento:</span> <?php echo $material->idelemento;?></li>
						<li><span>Subelemento:</span> <?php echo $material->idsubelemento;?></li>
					</ul>
					<hr />
				</div>
			</div>
			<table  cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%;">
                            <thead> 
				<tr>
                                        <th class="descricao" style="width: 10%">Data</th>
					<th class="descricao" style="width: 40%">Histórico</th>
					<th class="valores" style="width: 7%">Tipo</th>
					<th class="valores" style="width: 10%">Valor Unitário (R$)</th>
					<th class="valores" style="width: 10%">Quantidade</th>
					<th class="valores" style="width: 15%">Valor Total (R$)</th>
				</tr>
                             </thead>
                            <tbody>
				<?php foreach ($results as $entrada):
                                        if ($entrada->tipo == 1){
                                            $quant_total += $entrada->quant;
                                            $valor_unit_total = ($entrada->valor_unitario*$entrada->quant)+($quant_total*$valor_unit_total)/($entrada->quant+$quant_total);
                                            $valor_total += $entrada->valor_unitario*$entrada->quant;
                                            $nota = false;
                                        } elseif (($entrada->tipo == 3) || ($entrada->tipo == 9)){
                                            $quant_total -= $entrada->quant;
                                            $valor_unit_total = ($entrada->valor_unitario*$entrada->quant)+($quant_total*$valor_unit_total)/($entrada->quant+$quant_total);
                                            $valor_total -= $entrada->valor_unitario*$entrada->quant;
                                            $nota = false;
                                        }
				?>
                            
				<tr>
					<td class="data" style="text-align: center;"><?php echo $dataHelper->data(strtotime($entrada->data));?></td>
					<td class="descricao" style="text-align: left;">
						<?php                                            
						if (isset($entrada->notafiscal) && !empty($entrada->notafiscal)) {
							echo 'Nº NF: ' . $entrada->notafiscal;
							$nota = true;
						}
						if (isset($entrada->empenho) && !empty($entrada->empenho)) {
							if ($nota == true) {
								echo ' e ';
							}
							echo 'Nº EMPENHO: ' . $entrada->empenho;
						}
                                                if (isset($entrada->requisicao) && !empty($entrada->requisicao)) {
							echo 'REQUISIÇÃO Nº: ' . $entrada->requisicao;
						}                                               
						if ($entrada->tipo == 9) {
							echo 'BAIXA DE MATERIAL';
//                                                        if (isset($entrada->tipo_baixa) && !empty($entrada->tipo_baixa))
//                                                            echo - 'MOTIVO: '.$entrada->tipo_baixa;
                                                }                                                        
						?>
					</td>
                                        <?php                                                    
                                        if ($entrada->tipo == '1') {
                                            $entrada->tipo = 'ENTRADA';
                                        } elseif (($entrada->tipo == '3') || ($entrada->tipo == '9')){
                                            $entrada->tipo = 'SAÍDA';
                                        }    
                                        ?>
                                        <td class="valores" style="text-align: center;"><?php echo $entrada->tipo;?></td>
					<td class="valores" style="text-align: right;"><?php echo number_format($entrada->valor_unitario, 2, ',', '.');?></td>
					<td class="valores" style="text-align: right;"><?php echo number_format($entrada->quant, 0, '.', '.');?></td>
					<td class="valores" style="text-align: right;"><?php echo number_format($entrada->valor_unitario*$entrada->quant, 2, ',', '.');?></td>
				</tr>
				<?php endforeach;?>				
				<tfoot style="background-color: #D1CFD0;">
					<td class="descricao" style="text-align: center;">Saldo</td>
					<td class="descricao" style="text-align: center;">---</td>
					<td class="totais valores" style="text-align: center;">---</td>
                                        <td class="totais valores" style="text-align: right;">---</td>
					<td class="totais valores" style="text-align: right;"><?php echo number_format($quant_total, 0, ',', '.');?></td>
                                        <td class="totais valores" style="text-align: right;"><?php echo number_format($valor_total, 2, ',', '.');?></td>
				</tfoot>
                                </tbody>
			</table>
		</div>
		<div id="rodape"></div>
	</body>
</html>
<?php
$relatorio = ob_get_contents();
file_put_contents($tmpFile, $relatorio);
?>