<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../controller/ItemPatrimonio.php';
include_once '../../controller/UtilitariosSiga.php';
require_once '../../controller/DataHelper.php';

$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
//$css = $baseURL . '/relatorios2/view/statics/css/estilo.css';
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

$mesRelatorio = $_GET['mesRelatorio'];
$idInstituicao = $_GET['idInstituicao'];
$instituicao = $_GET['instituicao'];
$idVidaUtil = $_GET['idVidaUtil'];
$situacao = $_GET['situacao'];

$contacontabil = "";

if ($idVidaUtil != "") {
    $contacontabil = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspConta Contábil: " . $idVidaUtil;
}
$titulo = "Relatório de Depreciação por Itens Patrimoniais";
$titulo.=" " . $situacao;

//die("$mesRelatorio // $idInstituicao // $instituicao // $idVidaUtil");

$itens = ItemPatrimonio::DepreciacaoPorItem($mesRelatorio, $idInstituicao, $idVidaUtil, $situacao);
//print_r($itens);exit;

$filtroInstituicao = ($instituicao) ? $instituicao : "Todas";

if (!$itens) {
    ?>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");
        history.go(-1);
    </script>
    <?
} else {



    $totalValorBruto = 0;
    $totalValorDepreciado = 0;
    $totalValorDepreciadoMes = 0;
    $totalValorResidual = 0;
    $totalValorLiquido = 0;
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
                            {  "sType": "currency", "aTargets": [ 3 ]},
                            {  "sType": "currency", "aTargets": [ 4 ]},
                            {  "sType": "currency", "aTargets": [ 5 ]},
                            {  "sType": "currency", "aTargets": [ 6 ]},
                            {  "sType": "currency", "aTargets": [ 7 ]},
//                            {  "sType": "formatted-num", "aTargets": [ 3 ]},
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

                <?php include_once '../statics/cabecalho.php'; ?>
                <div id="menu">
                    <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                    <a href="<?php echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                </div>
                <div id="menu"><br/></div>
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                    <thead>
                        <tr>
                            <th class="data">Data de Aquisição</th>
                            <th class="descricao">Nº Tombo</th>
                            <th class="valores" style="width: 60%;">Item Patrimonial</th>
                            <?php
                            if ($situacao == 'Estornados') {
                                echo "<th class='valores'>Data de Estorno</th>";
                            }
                            ?>
                            <th class="valores">Valor Bruto (R$)</th>
                            <th class="valores">Valor Depreciado (R$)</th>
                            <th class="valores">Valor Depreciado Mês (R$)</th>
                            <th class="valores">Valor Residual (R$)</th>
                            <th class="valores">Valor Líquido (R$)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        for ($i = 0; $i < count($itens); $i++) {

                            $totalValorBruto += $itens[$i]['valor_bruto'];
                            $totalValorDepreciado += $itens[$i]['valordepreciado'];
                            $totalValorDepreciadoMes += $itens[$i]['valordepreciavelmes'];
                            $totalValorResidual += $itens[$i]['valorresidual'];
                            $totalValorLiquido += $itens[$i]['valorliquido'];

                            // valor residual = valor bruto * valor residual / 100
                            ?>
                            <tr>
                                <td class="valores" style="text-align: center;"><?php echo UtilitariosSiga::dataFromBanco($itens[$i]['dataaquisicao']); ?></td>
                                <td class="valores" style="text-align: left;"><?php echo $itens[$i]['iditempatrimonio']; ?></td>

                                <td class="valores" style="text-align: left;"><?php echo str_replace("/", "/ ", str_replace(";", " ", str_replace(",", " ", $itens[$i]['item']))); ?></td>
                                <?php
                                $dataestorno = UtilitariosSiga::dataFromBanco($itens[$i]['datamovimento']);
                                if ($situacao == 'Estornados') {
                                    echo "<td class='valores'>$dataestorno</td>";
                                }
                                ?>
                                <td class="valores" style="text-align: center;"><?php echo number_format($itens[$i]['valor_bruto'], 2, ',', '.'); ?></td>
                                <td class="valores" style="text-align: center;"><?php echo number_format($itens[$i]['valordepreciado'], 2, ',', '.'); ?></td>
                                <td class="valores" style="text-align: center;"><?php echo number_format($itens[$i]['valordepreciavelmes'], 2, ',', '.'); ?></td>
                                <td class="valores" style="text-align: center;"><?php echo number_format(($itens[$i]['valor_bruto'] * ($itens[$i]['valorresidual'] / 100)), 2, ',', '.'); ?></td>
                                <td class="valores" style="text-align: center;"><?php echo number_format($itens[$i]['valorliquido'], 2, ',', '.'); ?></td>
                            </tr>

                        <?php } ?>
                        <tfoot style="background-color: #D1CFD0;">
                                                <!--<tr>-->
                            <?php
                            if ($situacao == 'Estornados') {
                                echo "<th class='descricao' colspan='4'>Total</th>";
                            } else {
                                echo "<th class='descricao' colspan='3'>Total</th>";
                            }
                            ?>

                            <th class="totais"><?php echo number_format($totalValorBruto, 2, ',', '.'); ?></th>
                            <th class="totais"><?php echo number_format($totalValorDepreciado, 2, ',', '.'); ?></th>
                            <th class="totais"><?php echo number_format($totalValorDepreciadoMes, 2, ',', '.'); ?></th>
                            <th class="totais"><?php echo number_format($totalValorResidual, 2, ',', '.'); ?></th>
                            <th class="totais"><?php echo number_format($totalValorLiquido, 2, ',', '.'); ?></th>
                            <!--</tr>-->
                        </tfoot>
                    </tbody>
                </table>

            </div>


        </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents()); ?>

    <?php
}