<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

session_start();
$uos = $_SESSION['idUos'];
$idNotaFiscal = $_GET['idNotaFiscal'];
$idContaContabil = $_GET['idContaContabil'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];

//$dataAtual = date('d/m/Y');
$arrData1 = explode('/', $datafim);
$newDateFim = $arrData1 [2].'-'.$arrData1 [1].'-'.$arrData1 [0];

//$arrData2 = explode('/', $dataAtual);
//$newDateAtual = $arrData2 [2].'-'.$arrData2 [1].'-'.$arrData2 [0];

$arrData = explode('/', $datainicio);
$newDateInicio = $arrData [2].'-'.$arrData [1].'-'.$arrData [0];
//var_dump($newDateFim);var_dump($newDateInicio);var_dump($datafim);var_dump($datainicio);exit;
$sql = "SELECT tipomovimento, datamov, quantidade, valortotal, 
       ad_material.descricao, 
       ad_material.codmaterial, 
       ad_uo.sigla, 
       notafiscal, 
       empenho, 
       datahora, 
       datanotafiscal,
       ad_fornecedor.cnpj,
       ad_material.idsubelemento
FROM ad_movimento 
LEFT JOIN ad_material ON ad_movimento.idmaterial = ad_material.idmaterial
LEFT JOIN ad_uo ON ad_movimento.iduoalmox = ad_uo.iduo
LEFT JOIN ad_fornecedor ON ad_movimento.idfornecedor = ad_fornecedor.idfornecedor
       WHERE idmovimentoref IS NULL ";

if ($uos || $datainicio || $datafim || $idNotaFiscal) {
    if ($uos) {
        $tam = count($uos);
        for ($i = 0; $i < $tam; $i++) {
            $cont ++;
            if($cont == $tam)
                $ids .= $uos[$i];
                else
            $ids .= $uos[$i].',';
             
        }
        $sql.="  AND iduoalmox IN ($ids)";
    }if ($datainicio && $datafim) {
        $sql.=" AND ad_movimento.datamov between '$newDateInicio' and '$newDateFim'";
    }else if($datafim){
        $sql.=" AND ad_movimento.datamov < '$newDateFim'"; 
    }else if($idNotaFiscal){
        $sql.=" AND notafiscal like '%$idNotaFiscal%'"; 
    }if($idContaContabil){
        $sql.=" AND  ad_material.idelemento = '%$idContaContabil%'"; 
    }
    
}
//$sql.=" ORDER BY idrequisicao DESC ";

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


$arraySize = count($rows);
$titulo = "RELAÇÃO DE NOTAS FISCAIS<br/>";
//$veiculo = $rows[0]['modeloplaca']; 

if($datainicio||$datafim){
    $titulo .="PERÍODO: A partir de ". $datainicio." Até ". $datafim; 
 }



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
<!--            <div id="menu">
                <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                <a href="<?php // echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
            </div>-->
            <div id="menu"><br/></div>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                <thead> 
                    <tr>                                
                        <td style="width: 5%" class="valores">N° da Nota</td>
                        <td style="width: 5%" class="descricao">CNPJ</td>
                        <td style="width: 5%"class="descricao">SUB ELE MEN TO</td>
                        <td style="width: 5%"class="descricao">LANÇA MENTO</td>
                        <td  style="width:5%"class="data">DATA NOTA</td>
                        <td style="width: 5%" class="valores">MOVI MEN TAÇÃO</td>
                        <td style="width: 5%" class="data">DATA MOVIMEN TAÇÃO</td>
                        <td style="width: 5%" class="valores">QTD</td>
                        <td style="width: 2%" class="descricao">DESCRIÇÃO</td>
                        <td style="width: 5%" class="valores">COD. MATE RIAL</td>
                        <td style="width: 2%" class="descricao">SETOR</td>
                        <td style="width: 5%" class="descricao">EMPENHO</td>
                        <td style="width: 5%" class="valores">Total</td>
                    </tr>
                </thead>
                <tbody>
<?php
for ($i = 0; $i < count($rows); $i++) {
    //$saldoTotal += $rows[$i]['valor'];
    ?>                              
                        <tr>                                     
                            <td style="width: 5%"class="valores" style="text-align: center;"><?php echo $rows[$i]['notafiscal']; ?></td>
                            <td style="width: 5%"class="descricao" style="text-align: center;"><?php echo $rows[$i]['cnpj']; ?></td>
                            <td style="width: 5%"class="descricao" style="text-align: center;"><?php echo $rows[$i]['idsubelemento']; ?></td>
                            <td style="width: 5%"class="data" style="text-align: center;"><?php echo $rows[$i]['datahora']; ?></td>
                            <td style="width: 5%"class="data" style="text-align: center;"><?php echo $rows[$i]['datanotafiscal']; ?></td>
                            <?php  if($rows[$i]['tipomovimento'] == 1)
                                $movimento= "ENTRADA";?>
                            <?php  if($rows[$i]['tipomovimento'] == 2)
                                $movimento= "SAÍDA ";?>
                            <?php  if($rows[$i]['tipomovimento'] == 3)
                                $movimento= "ESTORNO DE ENTRADA";?>
                            <?php  if($rows[$i]['tipomovimento'] == 1)
                                $movimento= "ESTORNO DE SAÍDA";?>
                            <?php  if($rows[$i]['tipomovimento'] == 9)
                                $movimento= "BAIXA";?>
                            
                            <td style="width: 5%"class="valores" style="text-align: center;"><?php echo $movimento; ?></td>
                            <td style="width: 5%"class="data" style="text-align: center;"><?php echo $rows[$i]['datamov']; ?></td>
                            <td style="width: 5%"class="valores" style="text-align: center;"><?php echo $rows[$i]['quantidade']; ?></td>
                            <td style="width: 2%"class="descricao" style="text-align: center;"><?php echo $rows[$i]['descricao']; ?></td>
                            <td style="width: 5%"class="valores" style="text-align: center;"><?php echo $rows[$i]['codmaterial']; ?></td>
                            <td style="width: 5%"class="descricao" style="text-align: center;"><?php echo $rows[$i]['sigla']; ?></td>
                            <td style="width: 5%"class="descricao" style="text-align: center;"><?php echo $rows[$i]['empenho']; ?></td>
                            <td style="width: 5%"class="valores" style="text-align: right;"><?php echo number_format($rows[$i]['valortotal'], 2, ',', '.'); ?></td>
                        </tr>                            
    <?php
}
?>
                    <tfoot style="background-color: #D1CFD0;">
                         <td class="valores" style="text-align: center;">--</td>
                            <td class="descricao" style="text-align: center;">--</td>
                            <td class="descricao" style="text-align: center;">--</td>
                            <td class="data" style="text-align: center;">--</td>
                            <td class="data" style="text-align: center;">--</td> 
                             <td class="valores" style="text-align: center;">--</td>
                            <td class="data" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: center;">--</td>
                            <td class="descricao" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: center;">--</td>
                            <td class="descricao" style="text-align: center;">--</td>
                            <td class="descricao" style="text-align: center;">--</td>
                            <td class="valores" style="text-align: right;">--</td>
                    </tfoot>                         
                </tbody>    
            </table>                        
        </div>
    </body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents()); ?>

<?php 
