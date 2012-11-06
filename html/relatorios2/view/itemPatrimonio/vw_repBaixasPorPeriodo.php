<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$instituicoes = $_GET['instituicoes'];
$rows = $_GET['inst'];



$sql = "
SELECT DISTINCT
    ad_classificador.idclassificador as idclassificador,
    ad_classificador.descricao as classificador,
    cm_setor.siglasetor as setor,
    ad_itempatrimonio.iditempatrimonio as npat,
    ad_itempatrimonio.descricao as descricao,
    ad_itempatrimonio.valor as valor,
    cm_tabelageral.item2 as motivo,
    ad_movimentopat.motivobaixa,
    ad_movimentopat.numeroprocesso as nump,
    TO_CHAR(ad_movimentopat.data,'DD/MM/YYYY') as databaixa,
    TO_CHAR(ad_itempatrimonio.dataaquisicao,'DD/MM/YYYY') as dataaquisicao

FROM ((((ad_itempatrimonio
           INNER JOIN ad_movimentopat ON (ad_itempatrimonio.iditempatrimonio=ad_movimentopat.iditempatrimonio))
           INNER JOIN ad_classificador ON (ad_itempatrimonio.idclassificador=ad_classificador.idclassificador))
           INNER JOIN cm_setor ON (ad_itempatrimonio.idsetor=cm_setor.idsetor))
           INNER JOIN cm_tabelageral ON (ad_movimentopat.motivobaixa = cm_tabelageral.item1))

WHERE (
       ad_movimentopat.data >= to_date('$datainicio','DD/MM/YYYY') AND
       ad_movimentopat.data <= to_date('$datafim','DD/MM/YYYY') AND
       (ad_itempatrimonio.ativo = 'N') AND
       (ad_movimentopat.tipomovimento ='3') AND
       (cm_tabelageral.tabela = 'AD_MOTIVOBAIXAPAT') AND
       (cm_setor.idinstituicao in $rows))

ORDER BY ad_itempatrimonio.iditempatrimonio ASC";

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


/* if(!$itens) {
  ?>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script>
  alert("Não encontrado.");
  history.go(-1);
  </script>
  <?
  } else { */
$arraySize = count($rows);
$titulo1 = "RELATÓRIO DE BAIXAS POR INSTITUIÇÃO";
$titulo = "RELATÓRIO DE BAIXAS POR INSTITUIÇÃO"."<BR/>INSTITUIÇÕES: ". $instituicoes . "<BR/>PERÍODO: &nbsp". $datainicio . " A " . $_GET['datafim'];
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
                            {  "sType": "date-uk", "aTargets": [ 6 ]},
                            {  "sType": "date-uk", "aTargets": [ 7 ]},
                            {  "sType": "currency", "aTargets": [ 4 ]},
                            {  "sType": "formatted-num", "aTargets": [ 2 ]},
                            //                                                         {  "sType": "formatted-num", "aTargets": [  ]}                                                         
                        ]
                         
                    } );
                } );
            </script>
            </script>
            <title><?php echo $titulo1; ?></title>                    
        </head>
        <body align="center">

            <?php //ob_start();    ?>
            <div id="conteudo">

                <?php require_once '../statics/cabecalho_1.php'; ?>
<!--                <div id="menu">
                    <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                    <a href="<?php // echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                </div>-->
                <div id="menu"><br/></div>
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                    <thead> 
                        <tr>                                
                            <td class="valores">Tombo</td>
                            <td class="descricao">Descrição</td>
                            <td class="valores">Setor</td>
                            <td class="valores">Classificador</td>
                            <td class="valores">Valor</td>
                            <td class="descricao">Motivos</td>
                            <td class="data">Data de Aquisição</td>
                            <td class="data">Data Baixa</td>
                            <td class="descricao">Processo</td>                                  
                        </tr>
                    </thead> 
                    <tbody>
                        <?php
                        $saldoTotal = 0;
                        for ($i = 0; $i < count($rows); $i++) {
                            $saldoTotal += $rows[$i]['itempat_valor'];
                            ?>                              
                            <tr>                                     
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['npat']; ?></td>
                                <td class="descricao" style="text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['setor']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['idclassificador']; ?></td>
                                <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['valor'], 2, ',', '.'); ?></td>
                                <td class="descricao" style="text-align: left;"><?php echo $rows[$i]['motivo']; ?></td>
                                <td class="data" style="text-align: center;"><?php echo $rows[$i]['dataaquisicao']; ?></td>
                                <td class="data" style="text-align: center;"><?php echo $rows[$i]['databaixa']; ?></td>
                                <td class="descricao" style="text-align: right;"><?php echo $rows[$i]['nump']; ?></td>                                    
                            </tr>                            
                            <?php
                        }
                        ?>
                        <tfoot style="background-color: #D1CFD0;"">                                    

                            <td class="valores" style="text-align: left;">--</td>
                            <td class="valores" style="text-align: center;">--</td>
                            <td class="descricao" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: right;"><?php echo number_format($saldoTotal, 2, ',', '.'); ?></td>  
                            <td class="descricao" style="text-align: center;">--</td>                                    
                            <td class="data" style="text-align: center;">--</td>                                    
                            <td class="data" style="text-align: center;">--</td>                                    
                            <td class="descricao" style="text-align: center;">--</td>                                    

                        </tfoot>                         
                    </tbody>    
                </table>                        
            </div>
        </body>
    </html>
<?php file_put_contents($tmpFile, ob_get_contents()); ?>

<?php
