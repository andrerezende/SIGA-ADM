<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$idRequisicao = $_GET['idRequisicao'];
$status = $_GET['status'];

switch ($status){
    
    case 2://SOLICITADA igual a case 6 + (motivo)
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case 4://AUTORIZADA PELO GESTOR
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case 5://DEVOLVIDA PELO GESTOR
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, motivorejeicao, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case 6:
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, motivorejeicao,i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case 7://LIBERADA PARA EXECUCAO
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, v.modelo||' - '||v.placa as modeloplaca, p4.nome as motorista, 
i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  inner join ad_veiculo v on v.placa = i.placa 
inner join ad_motorista m on m.idmotorista = i.idmotorista
  inner join cm_usuario us1 on us1.idusuario = m.idusuario 
inner join cm_pessoa p4 on us1.idpessoa = p4.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case A://RECUSADA UO EXEC igual ao caso 5
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, motivorejeicao, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case G:
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, v.modelo||' - '||v.placa as modeloplaca, p4.nome as motorista, 
i.odometrosaida,TO_CHAR(i.datahorasaidagar, 'DD/MM/YY HH:MM:SS') 
as datahorasaidagar,i.odometrocheg,TO_CHAR(i.datahoracheggar, 'DD/MM/YY HH:MM:SS') 
  as datahoracheggar,i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  inner join ad_veiculo v on v.placa = i.placa 
inner join ad_motorista m on m.idmotorista = i.idmotorista
  inner join cm_usuario us1 on us1.idusuario = m.idusuario 
inner join cm_pessoa p4 on us1.idpessoa = p4.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case J://EM EXECUÇÃO
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, v.modelo||' - '||v.placa as modeloplaca, p4.nome as motorista, 
i.odometrosaida,TO_CHAR(i.datahorasaidagar, 'DD/MM/YY HH:MM:SS') 
as datahorasaidagar,i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
inner join cm_usuario u2 on r.idusuariogestor = u2.idusuario
  inner join cm_pessoa p2 on p2.idpessoa = i.idpessoa
inner join cm_pessoa p3 on p3.idpessoa = u2.idpessoa
  inner join ad_veiculo v on v.placa = i.placa 
inner join ad_motorista m on m.idmotorista = i.idmotorista
  inner join cm_usuario us1 on us1.idusuario = m.idusuario 
inner join cm_pessoa p4 on us1.idpessoa = p4.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
}

$sql.=" ORDER BY idrequisicao DESC ";

$sqli = "
SELECT ordem,TO_CHAR(datasaida, 'DD/MM/YY HH:MM:SS') 
  as datasaida, e.nomelocal as origem, e1.nomelocal as destino
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao 
  inner join ad_itinerario it on r.idrequisicao = it.idrequisicao
inner join ad_endereco e on e.idendereco = it.idenderecoorigem 
  inner join ad_endereco e1 on e1.idendereco = it.idenderecodestino 
where r.idrequisicao =  $idRequisicao ";

try {
    $db = Conexao::getInstance()->getDB();

    $preparedStatment = $db->prepare($sql);
    $preparedStatment1 = $db->prepare($sqli);


    $preparedStatment->execute();
    $preparedStatment1->execute();


    $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
    $rowsi = $preparedStatment1->fetchAll(PDO::FETCH_ASSOC);
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


$arraySize = count($rows);
$titulo = "REQUISIÇÃO: " . $idRequisicao . "<br/>";





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
            
            $(document).ready( function() {
                $('#tabela1').dataTable( {					
                        					
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
            <div id="menu">
                <a href="<?php echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
            </div>
            <div id="menu"><br/></div>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                <thead> 
                    <tr> 
                        <td class="valores">REQUISIÇÃO</td>
                        <td class="data">DATA/HORA</td>
                        <td class="descricao">SITUAÇÃO</td>
                        <td class="descricao">REALIZADA POR</td>
                        <td class="descricao">RESPONSÁVEL</td>
                        <td class="descricao">GESTOR</td>
                    </tr>
                </thead> 
                <tbody>
<?php
$arraySize = count($rows);
for ($i = 0; $i < $arraySize; $i++) {
    //$saldoTotal += $rows[$i]['valor'];
    ?>                              
                        <tr> 
                            <td style="width: 7em" class="valores" style="text-align: center;"><?php echo $rows[$i]['idrequisicao']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['datahorareq']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['status']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['realizada']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['responsavel']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['gestor']; ?></td>
                        </tr>                            
    <?php
}
?>
                    <tfoot style="background-color: #D1CFD0;">                                    
                        <td class="valores" style="text-align: left;"></td>
                        <td class="valores" style="text-align: center;"></td>
                        <td class="valores" style="text-align: center;"></td>
                        <td class="valores" style="text-align: center;"></td>
                        <td class="valores" style="text-align: center;"></td>
                        <td class="valores" style="text-align: center;"></td>
                    </tfoot>                         
                </tbody>    
            </table>                        
        </div>
        
        <!--ITINERÁRIO-->
        <?php //ob_start();     ?>
        <div id="conteudo">

<?php require_once '../statics/cabecalho.php'; ?>
                    <div id="menu"><br/></div>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela1" style="width: 100%">
                <thead> 
                    <tr> 
                        <td class="valores">ORDEM</td>
                        <td class="descricao">LOCAL DE ORIGEM</td>
                        <td class="descricao">LOCAL DE DESTINO</td>
                        <td class="data">DATA/HORA</td>
                    </tr>
                </thead> 
                <tbody>
<?php
for ($i = 0; $i < count($rowsi); $i++) {
    //$saldoTotal += $rows[$i]['valor'];
    ?>                              
                        <tr> 
                            <td class="valores" style="text-align: center;"><?php echo $rowsi[$i]['ordem']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rowsi[$i]['datasaida']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rowsi[$i]['origem']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rowsi[$i]['destino']; ?></td>
                        </tr>                            
    <?php
}
?>
                    <tfoot style="background-color: #D1CFD0;">                                    
                        <td class="valores" style="text-align: left;"></td>
                        <td class="valores" style="text-align: center;"></td>
                        <td class="valores" style="text-align: center;"></td>
                        <td class="valores" style="text-align: center;"></td>
                    </tfoot>                         
                </tbody>    
            </table>                        
        </div>
        
    </body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents()); ?>

<?php 
