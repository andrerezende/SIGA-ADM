<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$idVeiculo = $_GET['idVeiculo'];
$ididMotorista = $_GET['idMotorista'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$dataAtual = date('d/m/Y');
$arrData1 = explode('/', $datafim);
$newDateFim = $arrData1 [2].'-'.$arrData1 [1].'-'.$arrData1 [0];

$arrData2 = explode('/', $dataAtual);
$newDateAtual = $arrData2 [2].'-'.$arrData2 [1].'-'.$arrData2 [0];

$arrData = explode('/', $datainicio);
$newDate = $arrData [2].'-'.$arrData [1].'-'.$arrData [0];

$sql = "
select
	distinct  TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS')
	as datahorareq, r.idrequisicao, p.nome,t.item2, i.ordem, e.nomelocal
	as origem,e2.nomelocal as destino, v.modelo||' - '||v.placa as modeloplaca
	from ad_requisicao r INNER JOIN cm_tabelageral t on r.status = t.item1
	INNER JOIN ad_tiporeq o on o.idtiporeq = r.tiporequisicao
	inner join ad_itinerario i on i.idrequisicao = r.idrequisicao
	INNER JOIN ad_endereco e ON i.idenderecoorigem=e.idendereco INNER JOIN ad_endereco e2
        ON i.idenderecodestino=e2.idendereco
        inner join ad_itemreqveiculo it on r.idrequisicao = it.idrequisicao
        inner join ad_motorista m on m.idmotorista = it.idmotorista
        inner join cm_pessoa p on p.idpessoa = m.idpessoa 
        inner join ad_veiculo v on v.placa = it.placa
        inner join ad_veiculouo uo on v.placa = uo.placa
        where o.idtiporeq = 4 and t.tabela = 'AD_ALMOXSTATUSREQ' ";

if ($idVeiculo || $datainicio || $datafim) {
    if ($idVeiculo) {
        $sql.=" AND it.placa like '%$idVeiculo%'";
    }
    if ($datainicio && $datafim) {
        $sql.=" AND r.datahorareq between '$newDate' and '$newDateFim'";
    }else if($datainicio){
        $sql.=" AND r.datahorareq between '$newDate' and '$newDateAtual'"; 
    }else if($datafim){
        $sql.=" AND r.datahorareq < '$newDateFim'"; 
    }
    
}
$sql.=" ORDER BY idrequisicao DESC ";

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
$titulo = "MAPA DE UTILIZAÇÃO DE VEÍCULO<br/>";
$titulo1 = "MAPA DE UTILIZAÇÃO DE VEÍCULO";
$veiculo = $rows[0]['modeloplaca']; 

 if ($idVeiculo != "") {
    $titulo .= "VEÍCULO: " . $veiculo ." <br/>";
 }if($datainicio && $datafim){
    $titulo .="PERÍODO: De ". $datainicio. " a ". $datafim; 
 }else if($datainicio){
    $titulo .="PERÍODO: A partir de ". $datainicio; 
 }else if($datafim){
    $titulo .="PERÍODO: Até ". $datafim; 
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
                        <td class="data">DATA / HORA</td>
                        <td class="descricao">REQUISIÇÃO</td>
                        <td class="descricao">ORIGEM</td>
                        <td class="descricao">DESTINO</td>
                        <td class="descricao">MOTORISTA</td>
                        <td class="valores">SITUAÇÃO</td>
                    </tr>
                </thead> 
                <tbody>
<?php
for ($i = 0; $i < count($rows); $i++) {
    //$saldoTotal += $rows[$i]['valor'];
    ?>                              
                        <tr>                                     
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['datahorareq']; ?></td>
                            <td style="width: 7em" class="valores" style="text-align: center;"><?php echo $rows[$i]['idrequisicao']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['origem']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['destino']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['nome']; ?></td>
                            <td class="valores" style="text-align: left;"><?php echo $rows[$i]['item2']; ?></td>
                        </tr>                            
    <?php
}
?>
                    <tfoot style="background-color: #D1CFD0;">                                    
                        <td class="valores" style="text-align: left;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
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
