<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$notafiscal = $_GET['notafiscal'];
$descricao = $_GET['descricao'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$ativo = $_GET['ativo'];



$sql = "
select
	TO_CHAR(i.dataaquisicao,'DD/MM/YYYY') as dataaquisicao,
	i.iditempatrimonio as iditempatrimonio,
	i.descricao as descricao,
	i.marcamodelo as marcamodelo,
	i.valor as valor,
	s.siglasetor as siglasetor,
	a.notafiscal as notafiscal

from ad_itempatrimonio i inner join ad_notafiscal a
on i.idnotafiscal=a.idnotafiscal inner join cm_setor s
on i.idsetor=s.idsetor ";

if ($notafiscal || $descricao || $datainicio || $datafim || $ativo) {
    if ($notafiscal) {
        $sql.=" AND a.notafiscal like '%$notafiscal%'";
    }
    if ($descricao) {
        $sql.=" AND i.descricao like '%$descricao%'";
    }
    if ($datainicio) {
        $sql.=" AND i.dataaquisicao >=" . "'" . $datainicio . "'";
    }
    if ($datafim) {
        $sql.=" AND i.dataaquisicao <=" . "'" . $datafim . "'";
    }
    if ($ativo) {
        $sql.="  AND cast(i.ativo as text) =" . "'" . $ativo . "'";
    }
}
$sql.=" order by i.dataaquisicao, a.notafiscal ";

try {
    $db = Conexao::getInstance()->getDB();

    $preparedStatment = $db->prepare($sql);


    $preparedStatment->execute();


    $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
    //var_dump($rows);exit;
    Conexao::getInstance()->disconnect();
} catch (Exception $e) {
    $e->getMessage();
}


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



//echo $dnotafiscal = $_GET['notafiscal'];
//die("$mesRelatorio // $idInstituicao // $instituicao // $idVidaUtil");
//print_r($itens);exit;



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
$titulo = "RELATÓRIO DE INTENS ESTORNADOS<br/>"."NOTA FISCAL= ".$notafiscal."<br/>DESCRIÇÃO DO INTEM= ".$descricao."<BR/>A PARTIR DE ".$datainicio." ATÉ ".$datafim;
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
                       {  "sType": "formatted-num", "aTargets": [ 4 ]},
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

<?php require_once '../statics/cabecalho.php'; ?>
<!--            <div id="menu">
                <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                <a href="<?php // echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
            </div>-->
            <div id="menu"><br/></div>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                <thead> 
                    <tr>                                
                        <td class="data">Data de Aquisição</td>
                        <td class="descricao">Nº Tombo</td>
                        <td class="valores">Item Patrimonial</td>
                        <td class="descricao">Marca</td>
                        <td class="valores">Valor Bruto(R$)</td>
                        <td class="descricao">Sigla</td>
                        <td class="valores">Nota Fiscal</td>
                    </tr>
                </thead> 
                <tbody>
<?php
$saldoTotal = 0;
for ($i = 0; $i < count($rows); $i++) {
    $saldoTotal += $rows[$i]['valor'];
    ?>                              
                        <tr>                                     
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['dataaquisicao']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['iditempatrimonio']; ?></td>
                            <td class="valores" style="text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['marcamodelo']; ?></td>
                            <td class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['valor'], 2, ',', '.'); ?></td>
                            <td class="valores" style="text-align: left;"><?php echo $rows[$i]['siglasetor']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['notafiscal']; ?></td>
                        </tr>                            
    <?php
}
?>
                    <tfoot style="background-color: #D1CFD0;">                                    
                        <td class="valores" style="text-align: left;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: right;"><?php echo number_format($saldoTotal, 2, ',', '.'); ?></td>  
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
