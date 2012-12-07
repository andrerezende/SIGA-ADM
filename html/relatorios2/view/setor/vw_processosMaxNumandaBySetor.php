<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';
require_once '../../controller/Setor.php';

$setor = $_GET['setor'];

//$processos = Setor::getProcessosByAllSetores();
// 11-10-2011 - Daniel Bonfim
$processos = Setor::getProcessosBySetor($setor);
//print_r($processos);exit;


$dataHelper = new DataHelper();

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

$titulo = "RELATÓRIO DE PROCESSOS DO SETOR $setor";


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
                    "iDisplayLength": 10,
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
        <title><?php echo $titulo1; ?></title>                    
    </head>
    <body align="center">

<?php //ob_start();     ?>
        <div id="conteudo">

<?php require_once '../statics/cabecalho.php'; ?>

            <div id="menu"><br/></div>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                <thead> 
                    <tr>                                
                        <td class="data">Processo</td>
                        <td class="descricao">Origem</td>
                        <td class="valores">Data de entrada</td>
                        <td class="descricao">Tempo parado</td>
                        <td class="valores">Status</td>
                        <td class="descricao" style="text-align: center;">Solicitante</td>
                        <td class="valores">Título</td>
                        <td class="valores">Assunto</td>
                    </tr>
                </thead> 
                <tbody>
                     <?php foreach($processos as $proc) { ?>

                                <tr>
                                    <td class="valores"><?php echo $proc['processo']; ?></td>
                                    <td class="valores"><?php echo $proc['setororigem']; ?></td>
                                    <td class="data"><?php echo $proc['datahoraentrada']; ?></td>
                                    <td class="valores"><?php echo $proc['tempo_parado']; ?></td>
                                    <td class="valores"><?php echo $proc['situacao']; ?></td>
                                    <td class="descricao"><?php echo $proc['solicitante']; ?></td>
                                    <td class="valores"><?php echo $proc['titulo']; ?></td>
                                    <td class="descricao"><?php echo str_replace("/", "/ ", str_replace("720000195306151000", "720000195306151000 ", str_replace(".", ". ", str_replace(";", "; ", str_replace(",", ", ", $proc['assunto']))))); ?></td>                         
                                </tr>
                        
                    <?php } ?>
                 <tfoot style="background-color: #D1CFD0;">                                    
                        <td class="valores" style="text-align: left;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: right;">--</td>  
                        <td class="valores" style="text-align: center;">--</td>                                    
                        <td class="valores" style="text-align: center;">--</td>   
                        <td class="valores" style="text-align: center;">--</td>
                    </tfoot>                         
                </tbody>    
            </table>                        
        </div>
    </body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents()); ?>

<?php 
