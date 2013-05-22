<?php
ob_start();
//ini_set('display_errors', 1);
//require_once '../../model/DAO/Conexao.php';
//require_once '../../controller/DataHelper.php';
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
//var_dump("teste");exit;
$rmbConsolidado = new RmbAnalitico();

$nomesInstituicoes = $rmbConsolidado->getNomesInstituicoes(array('mesAnoRef' => $mesAnoRef, 'idsRef' => $ids));
$result = $rmbConsolidado->geraRelatorio(array('mesAnoRef' => $mesAnoRef, 'idsRef' => $ids));


$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
//$css = $baseURL.'/relatorios2/view/statics/css/estilo.css';
$css0 = $baseURL . '/relatorios2/view/statics/css/estilo3.css';
$css3 = $baseURL . '/relatorios2/view/statics/css/demo_table_jui.css';
$css4 = $baseURL . '/relatorios2/view/statics/css/jquery-ui-1.8.21.custom.css';

$js1 = $baseURL . '/relatorios2/view/statics/js/jquery.js';
$js2 = $baseURL . '/relatorios2/view/statics/js/jquery.dataTables.js';
$js3 = $baseURL . '/relatorios2/view/statics/js/formatted-currency-asc.js';
// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL . '/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);


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
                    "aoColumnDefs": [  //{ "bSortable": false, "aTargets": [ 4 ] } ,
                       {  "sType": "date-uk", "aTargets": [ 0 ]},
                       {  "sType": "currency", "aTargets": [  ]},
                       {  "sType": "currency", "aTargets": [ 4 ]},
                        //                                                         {  "sType": "formatted-num", "aTargets": [  ]}                                                         
                    ]
                         
                } );
            } );
        </script>
        </script>
        <title><?php echo $titulo; ?></title>                    
    </head>
    <body align="center">

<?php //ob_start();     ?>
        <div id="conteudo">

<?php //require_once '../statics/cabecalho.php'; ?>
<!--            <div id="menu">
                <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                <a href="<?php // echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
            </div>-->
            <div id="menu"><br/></div>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                <thead> 
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
                </thead> 
                <tbody>
                    
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
                                ?>
<?php
for ($i = 1; $i < $j; $i++) :
    //$saldoTotal += $rows[$i]['valor'];
    ?>                              
                        <tr>                                     
                            <td class="valores" style="text-align: center;"><?php echo $vidautil_descricao[$i]; ?></td>
                            <td style="width: 7em" class="valores" style="text-align: center;"><?php echo number_format($total_vidautil_saldo_anterior[$i], 2, ',', '.');?></td>
                            <td class="valores" style="text-align: center;"><?php echo number_format($total_vidautil_entrada[$i], 2, ',', '.');?></td>
                            <td class="valores" style="text-align: center;"><?php echo number_format($total_vidautil_saida[$i], 2, ',', '.');?></td>
                            <td class="valores" style="text-align: center;"><?php echo number_format($total_vidautil_saldo[$i], 2, ',', '.');?></td>
                            <td class="valores" style="text-align: left;"><?php echo $item_patri_codigo[$i];?></td>
                            <td class="valores" style="text-align: center;"><?php echo $item_patri_descricao[$i];?></td>
                            <td class="valores" style="text-align: center;"><?php echo $item_patri_dataaquisicao[$i];?></td>
                            <td class="valores" style="text-align: center;"><?php echo $nota_notafiscal[$i];?></td>
                            <td class="valores" style="text-align: left;"><?php echo $nota_data[$i];?></td>
                            <td class="valores" style="text-align: center;"><?php echo $nota_cnpj[$i];?></td>
                            <td class="valores" style="text-align: left;"><?php echo $nota_dataateste[$i];?></td>
                        </tr>                            
    <?php
endfor;
?>
                    <tr>
					<th class="descricao">Total</th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_saldo_anterior), 2, ',', '.');?></th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_entrada), 2, ',', '.');?></th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_saida), 2, ',', '.');?></th>
					<th class="totais valores"><?php echo number_format(array_sum($total_vidautil_saldo), 2, ',', '.');?></th>
                                        </tr>
                    <tfoot style="background-color: #D1CFD0;">                                   
                    </tfoot>                         
                </tbody>    
            </table>                        
        </div>
    </body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents()); ?>

<?php 
