<?php 
ob_start();

require_once '../../controller/Almoxerifado.php';
require_once '../../controller/DataHelper.php';

$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . '/relatorios/statics/';
$baseURL2 = 'http://' . $_SERVER['HTTP_HOST'];

$css0 = $baseURL2 . '/relatorios2/view/statics/css/estilo3.css';
$css3 = $baseURL2 . '/relatorios2/view/statics/css/demo_table_jui.css';
$css4 = $baseURL2 . '/relatorios2/view/statics/css/jquery-ui-1.8.21.custom.css';


$js1 = $baseURL2 . '/relatorios2/view/statics/js/jquery.js';
$js2 = $baseURL2 . '/relatorios2/view/statics/js/jquery.dataTables.js';
$js3 = $baseURL2 . '/relatorios2/view/statics/js/jquery.dataTables.js';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL.'/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);

$idUoAlmoxerifado = $_GET['idUoAlmoxerifado'];
$mes = $_GET['mes'];
$ano = $_GET['ano'];
$notaFiscal = $_GET['notaFiscal'];
$tipo = $_GET['tipo'];
$filtradoPor = $_GET['filtradoPor'];
$uo = $_GET['uo'];


$mesExtenso = null;
switch($mes) {
    case 1:
        $mesExtenso = "Janeiro";
        break;
    case 2:
        $mesExtenso = "Fevereiro";
        break;
    case 3:
        $mesExtenso = "Março";
        break;
    case 4:
        $mesExtenso = "Abril";
        break;
    case 5:
        $mesExtenso = "Maio";
        break;
    case 6:
        $mesExtenso = "Junho";
        break;
    case 7:
        $mesExtenso = "Julho";
        break;
    case 8:
        $mesExtenso = "Agosto";
        break;
    case 9:
        $mesExtenso = "Setembro";
        break;
    case 10:
        $mesExtenso = "Outubro";
        break;
    case 11:
        $mesExtenso = "Novembro";
        break;
    case 12:
        $mesExtenso = "Dezembro";
        break;
}

$mesExtenso = strtoupper($mesExtenso);
$periodo = "PERÍODO DE REFERÊNCIA: $mesExtenso/$ano";
if ($notaFiscal) $periodo .= '</br>NOTA FISCAL: '.$notaFiscal;

if($tipo == "SUBELEMENTO") {
    
    if($filtradoPor == 'VALOR TOTAL') { 
        $rows = Almoxerifado::RMASubElementoConsolidadoAcumuladoPorValorTotal($idUoAlmoxerifado, $mes, $ano);
        $titulo = "Relatório de Movimentação de Almoxarifado (RMA) - Sub Elemento por Preço<br/> da $uo";
    }
    else if($filtradoPor == 'QUANTIDADE') {
        $rows = Almoxerifado::RMASubElementoConsolidadoAcumuladoPorQuantidade($idUoAlmoxerifado, $mes, $ano);
        $titulo = "Relatório de Movimentação de Almoxarifado (RMA) - Sub Elemento por Quantidade";
    }     
    else {
        throw new Exception("Definição do filtro não especificada.");
    }
    
} else if($tipo == "MATERIAL") {
    
    if($filtradoPor == 'VALOR TOTAL') { 
        $rows = Almoxerifado::RMAMaterialConsolidadoAcumuladoPorValorTotal($idUoAlmoxerifado, $mes, $ano, $notaFiscal);
        $titulo = "Relatório de Movimentação de Almoxarifado (RMA) - Material por Preço<br/> da $uo";
    }
    else if($filtradoPor == 'QUANTIDADE') {
        $rows = Almoxerifado::RMAMaterialConsolidadoAcumuladoPorQuantidade($idUoAlmoxerifado, $mes, $ano, $notaFiscal);
        $titulo = "Relatório de Movimentação de Almoxarifado (RMA) - Material por Quantidade";
    }     
    else {
        throw new Exception("Definição do filtro não especificada.");
    }
    
} else {
    throw new Exception("Tipo do relatório não definido.");
}
    
    //$url = "../../PRINT_PDF/almoxerifado/pdf_rmaByValorTotal.php?idUoAlmoxerifado=$idUoAlmoxerifado&mes=$mes&ano=$ano";
    
    ?>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
    <html>
            <head>
                    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />

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
					
					"aoColumnDefs": [
						{ "bVisible": true, "aTargets": [ 0 ] }
					],
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
                                        "aoColumnDefs": [
                                                         {  "sType": "currency", "aTargets": [ 2 ]},
                                                         {  "sType": "currency", "aTargets": [ 3 ]},
                                                         {  "sType": "currency", "aTargets": [ 4 ]},
                                                         {  "sType": "currency", "aTargets": [ 5 ]},
                                                         {  "sType": "currency", "aTargets": [ 6 ]}
//                                                        { "bSortable": false, "aTargets": [ 2 ] } ,
//                                                        { "bSortable": false, "aTargets": [ 3 ] } ,
//                                                        { "bSortable": false, "aTargets": [ 4 ] } ,
//                                                        { "bSortable": false, "aTargets": [ 5 ] } ,
//                                                        { "bSortable": false, "aTargets": [ 6 ] } ,
                                        ]


				} );
			} );
		</script>
                </script>
                    <title><?php echo $titulo; ?></title>                    
            </head>
            <body align="center">
					
                <?php //ob_start(); ?>
                    <div id="conteudo">

                        <?php require_once '../statics/cabecalho.php'; ?>

                        <div id="menu"><br/>
<!--                            <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>-->
			</div>
                            
                        <table  cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%;">
                            <thead> 
                                <tr>                                
                                     <?php if($tipo == 'MATERIAL') { ?> 
                                        <th class="valores" style="width: 5%">Material</th>                                      
                                    <?php } else if($tipo == "SUBELEMENTO") { ?>
                                        <th class="valores" style="width: 15%">Código</th>
                                    <?php } ?>

                                    <th class="descricao" style="width: 40%">Descrição</th>
                                    <th class="valores" style="width: 10%">Saldo anterior</th>
                                    <th class="valores" style="width: 7%">Entrada</th>
                                    <th class="valores" style="width: 8%">Entrada extra</th>
                                    <th class="valores" style="width: 7%">Saída</th>
                                    <th class="valores" style="width: 8%">Saldo atual</th>                        
                                </tr>
                            </thead> 
                        <tbody>
                        <?php
                        $totalSaldoAnt = 0;
                        $totalEntr = 0;
                        $totalEntrExtra = 0;
                        $totalSaida = 0;
                        $totalSaldoAtual = 0;
                        for($i=0; $i<count($rows); $i++) {  
                            $totalSaldoAnt += $rows[$i]['saldo_anterior'];
                            $totalEntr += $rows[$i]['entrada'];
                            $totalEntrExtra += $rows[$i]['entrada_extra'];
                            $totalSaida += $rows[$i]['saida'];
                            $totalSaldoAtual += $rows[$i]['saldo_atual'];
                            ?>
                               
                                <tr> 
                                   <?php if($tipo == 'MATERIAL') { ?> 
                                        <td class="valores"><?php echo $rows[$i]['idmaterial']; ?></td>                                     
                                    <?php } else if($tipo == "SUBELEMENTO") { ?>
                                        <td class="valores"><?php echo $rows[$i]['idsubelemento']; ?></td>
                                    <?php } ?>
                                                                            
                                    <td class="valores"><?php echo $rows[$i]['descricao']; ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['saldo_anterior'], 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['entrada'], 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['entrada_extra'], 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['saida'], 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['saldo_atual'], 2, ',', '.'); ?></td>                          
                                </tr>
                                    
                            
                        <?php                     
                        }                                                
                        ?>     
                                 <tfoot style="background-color: #D1CFD0;">
                                    <td class="valores">Total</td> 
                                    <td class="valores">--</td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($totalSaldoAnt, 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($totalEntr, 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($totalEntrExtra, 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($totalSaida, 2, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($totalSaldoAtual, 2, ',', '.'); ?></td>                          
                                </tfoot>
                         </tbody>    
                        </table>
                        
                    </div>
            </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents());?>


