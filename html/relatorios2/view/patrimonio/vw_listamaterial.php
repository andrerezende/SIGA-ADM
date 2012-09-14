<?php

ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$idUO = $_GET['idUoAlmoxerifado'];
$uo = $_GET['uo'];

$sql = '
SELECT m.codmaterial, m.descricao, m.unidade, e.estoquemin, e.estoque, e.valortotal
FROM ad_estoque e
	INNER JOIN ad_material m on e.idmaterial = m.idmaterial
WHERE iduo = '.$idUO.
' ORDER BY m.descricao'; 

try {
	$db = Conexao::getInstance()->getDB();

	$preparedStatment = $db->prepare($sql);


	$preparedStatment->execute();


	$rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

	Conexao::getInstance()->disconnect();
} catch (Exception $e) {
	$e->getMessage();
}

$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css0 = $baseURL . '/relatorios2/view/statics/css/estilo3.css';
$css3 = $baseURL . '/relatorios2/view/statics/css/demo_table_jui.css';
$css4 = $baseURL . '/relatorios2/view/statics/css/jquery-ui-1.8.21.custom.css';

$js1 = $baseURL . '/relatorios2/view/statics/js/jquery.js';
$js2 = $baseURL . '/relatorios2/view/statics/js/jquery.dataTables.js';
$js3 = $baseURL . '/relatorios2/view/statics/js/formatted-currency-asc.js';

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL . '/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);

$arraySize = count($rows);

$titulo = "LISTA DE MATERIAIS DA $uo";


if(!$rows) {
    ?>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");  
        history.go(-1);
    </script> 
    <?
} else {
    
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
                <script type="text/javascript" src="<?php echo $js3 ?>"></script>
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
                                                         {  "sType": "currency", "aTargets": [ 4 ]},
                                                         {  "sType": "formatted-num", "aTargets": [ 2 ]},
                                                         {  "sType": "formatted-num", "aTargets": [ 3 ]}                                                         
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

                        <div id="menu"><br/></div>
                        <table  cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%;">
                            <thead> 
                                <tr>                                
                                    <th class="valores">Código</th>  
                                    <th class="descricao">Classificação</th>                                    
                                    <th class="valores">Estoque</th>   
                                    <th class="valores">Estoque Min</th>
                                    <th class="valores">Valor Total</th>
                                </tr>
                            </thead> 
                        <tbody>
                        <?php 
                        $saldoTotal = 0;
                        for($i=0; $i<count($rows); $i++) {  
                           $saldoTotal += $rows[$i]['valortotal'];
                         ?>
                               
                                <tr> 
                                    
                                    <td class="valores" style="text-align: center;"><?php echo $rows[$i]['codmaterial']; ?></td>
                                    <td class="descricao" style="text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['estoque'], 0, ',', '.'); ?></td>
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['estoquemin'], 0, ',', '.'); ?></td>                                    
                                    <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['valortotal'], 2, ',', '.'); ?></td>                                    
                                </tr>
                                    
                            
                        <?php                     
                        }                                                
                        ?> 
                                <tfoot style="background-color: #D1CFD0;"">                                    
                                    <td class="valores" style="text-align: center;">Total</td>
                                    <td class="descricao" style="text-align: center;">--</td>
                                    <td class="valores" style="text-align: right;">--</td>
                                    <td class="valores" style="text-align: right;">--</td>                                    
                                    <td class="valores" style="text-align: right;"><?php echo number_format($saldoTotal, 2, ',', '.'); ?></td>                                    
                                </tfoot>
                         </tbody>    
                        </table>
                        
                    </div>
            </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents());?>

<?php }
