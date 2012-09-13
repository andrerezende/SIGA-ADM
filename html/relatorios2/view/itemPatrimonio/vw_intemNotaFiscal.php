<?php
ini_set('memory_limit', '128M');
ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$idUO = $_GET['idPatrimonio'];
$uo = $_GET['uo'];

$sql = "
SELECT 
	nf.notafiscal, 
	TO_CHAR(nf.datanotafiscal,'DD/MM/YYYY') AS datanotafiscal,
        nf.valor AS valor, 
	TO_CHAR(nf.dataateste,'DD/MM/YYYY') AS dataateste,
	it.descricao,
	count(*)
FROM
	ad_notafiscal nf
JOIN 
	ad_itempatrimonio it ON (nf.idnotafiscal = it.idnotafiscal)


GROUP BY
	nf.notafiscal, nf.situacao, nf.datanotafiscal, nf.valor, nf.dataateste, it.descricao

HAVING nf.situacao='A'

ORDER BY 
	nf.notafiscal asc, CAST(datanotafiscal as date) desc";

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

$titulo = "RELATÓRIO DE NOTAS FISCAIS";


if (!$rows) {
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
                            {  "sType": "date-uk", "aTargets": [ 1 ]},
                            {  "sType": "date-uk", "aTargets": [ 2 ]},
                            {  "sType": "currency", "aTargets": [ 4 ]},
                            {  "sType": "formatted-num", "aTargets": [ 2 ]},
                            //                                                         {  "sType": "formatted-num", "aTargets": [  ]}                                                         
                        ]
     
                    } );
                } );
            </script>
            </script>
            <title><?php echo $titulo; ?></title>                    
        </head>
        <body align="center">

            <?php //ob_start();  ?>
            <div id="conteudo">

                <?php require_once '../statics/cabecalho.php'; ?>
                <div id="menu">
                    <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                    <a href="<?php echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                </div>
                <div id="menu"><br/></div>
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%;">
                    <thead> 
                        <tr>                                
                            <th class="valores">Nº Nota Fiscal</th>  
                            <th class="valores">Data de Emisão</th>  
                            <th class="valores">Data Ateste</th>
                            <th class="descricao">Descrição</th>
                            <th class="valores">Quant.</th>                                    
                            <th class="valores">Valor Residual</th>                                    
                        </tr>
                    </thead> 
                    <tbody>
                        <?php
                        $saldoTotal = 0;
                        for ($i = 0; $i < count($rows); $i++) {
                            $saldoTotal += $rows[$i]['valor'];
                            ?>                              
                            <tr>                                     
                                <td class="valores" style="text-align: left;"><?php echo $rows[$i]['notafiscal']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['datanotafiscal']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['dataateste']; ?></td>
                                <td class="descricao" style="text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['count']; ?></td>
                                <td class="valores" style="text-align: right;"><?php echo $rows[$i]['valor']; ?></td>                                    
                            </tr>                            
                            <?php
                        }
                        ?>
                        <tfoot style="background-color: #D1CFD0;"">                                    
                                    <!-- <td class="valores" style="text-align: center;">--</td>-->
                            <td class="valores" style="text-align: left;">--</td>
                            <td class="descricao" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: center;">--</td>                                    
                            <td class="valores" style="text-align: right;"><?php echo number_format($saldoTotal, 2, ',', '.'); ?></td>                                    
                        </tfoot>                         
                    </tbody>    
                </table>                        
            </div>
        </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents()); ?>

    <?php
}
