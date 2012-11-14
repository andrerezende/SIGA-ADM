<?php
ini_set('memory_limit', '128M');
ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$idUO = $_GET['idPatrimonio'];
$uo = $_GET['uo'];

$sql = '
select idvidautil, descricao, anosvidautil, valorresidual
from ad_vidautil
ORDER BY idvidautil';

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

$titulo = "LISTA DE CONTAS CONTÁBEIS";


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
                        "aaSorting": [[ 1, "asc" ]]


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
<!--                <div id="menu">
                    <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                    <a href="<?php // echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                </div>-->
                <div id="menu"><br/></div>
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%;">
                    <thead> 
                        <tr>                                
                            <th class="valores">Código</th>  
                            <th class="descricao">Descrição</th>
                            <th class="valores">Vida Útil (Anos)</th>
                            <th class="valores">Valor Residual (%)</th>                                    
                        </tr>
                    </thead> 
                    <tbody>
                        <?php for ($i = 0; $i < count($rows); $i++) { ?>                               
                            <tr>                                     
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['idvidautil']; ?></td>
                                <td class="descricao" style="text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                                <td class="valores" style="text-align: right;"><?php echo $rows[$i]['anosvidautil']; ?></td>
                                <td class="valores" style="text-align: right;"><?php echo $rows[$i]['valorresidual']; ?></td>                                    
                            </tr>                            
                            <?php
                        }
                        ?>                          
                    </tbody>    
                </table>                        
            </div>
        </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents()); ?>

<?php
}
