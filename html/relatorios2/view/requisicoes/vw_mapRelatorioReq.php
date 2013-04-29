<?php
ini_set('memory_limit', '128M');
ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';
$idRequisicao = $_GET['idRequisicao'];
$status = $_GET['status'];

switch ($status){
    
    case 1://SOLICITADA igual a case 6 + (motivo)
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada 
  FROM ad_requisicao r inner join ad_itemreqveiculo i
on r.idrequisicao = i.idrequisicao
  INNER JOIN cm_tabelageral t on r.status = t.item1
inner join cm_usuario u on r.idusuarioreq = u.idusuario
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case 2://SOLICITADA igual a case 6 + (motivo)
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros,i.obs 
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
as gestor, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros,i.obs
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
as gestor, motivorejeicao, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros, i.obs 
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
as gestor, motivorejeicao,i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros, i.obs 
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
i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros, i.obs 
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
  inner join cm_pessoa p4 on p4.idpessoa = m.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case A://RECUSADA UO EXEC igual ao caso 5
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, motivorejeicao, i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros, i.obs 
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
  as datahoracheggar,i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros, i.obs 
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
  inner join cm_pessoa p4 on p4.idpessoa = m.idpessoa
  where t.tabela = 'AD_ALMOXSTATUSREQ' and r.idrequisicao = $idRequisicao ";
        break;
    case J://EM EXECUÇÃO
        $sql = "
SELECT r.idrequisicao, TO_CHAR(r.datahorareq, 'DD/MM/YY HH:MM:SS') 
  as datahorareq, t.item2 as status, p.nome 
as realizada, p2.nome as responsavel, p3.nome 
as gestor, v.modelo||' - '||v.placa as modeloplaca, p4.nome as motorista, 
i.odometrosaida,TO_CHAR(i.datahorasaidagar, 'DD/MM/YY HH:MM:SS') 
as datahorasaidagar,i.justificativa, qtdvolume, qtdpassageiros, outrospassageiros, i.obs 
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
  inner join cm_pessoa p4 on p4.idpessoa = m.idpessoa
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

$sqla = "
SELECT TO_CHAR(a.datahoraabastecimento, 'DD/MM/YY HH:MM:SS') 
as datahoraabastecimento, e.nomelocal as local,combustivel, valorabastecimento, odometro
  FROM ad_abastecimento a INNER JOIN ad_requisicao r on r.idrequisicao = a.idrequisicao
  inner join ad_endereco e on e.idendereco = a.idendereco
where  r.idrequisicao =  $idRequisicao ";

$sqle = "
SELECT p.nome
  FROM ad_itemreqveiculo i
inner join cm_usuario u on u.idusuario = i.idusuarioexecutor
  inner join cm_pessoa p on p.idpessoa = u.idpessoa 
  where  i.idrequisicao =  $idRequisicao";

try {
    $db = Conexao::getInstance()->getDB();

    $preparedStatment = $db->prepare($sql);
    $preparedStatment1 = $db->prepare($sqli);
    $preparedStatment2 = $db->prepare($sqla);
    $preparedStatment3 = $db->prepare($sqle);


    $preparedStatment->execute();
    $preparedStatment1->execute();
    $preparedStatment2->execute();
    $preparedStatment3->execute();

    $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
    $rowsi = $preparedStatment1->fetchAll(PDO::FETCH_ASSOC);
    $rowsa = $preparedStatment2->fetchAll(PDO::FETCH_ASSOC);
    $rowse = $preparedStatment3->fetchAll(PDO::FETCH_ASSOC);

    Conexao::getInstance()->disconnect();
} catch (Exception $e) {
    $e->getMessage();
}


$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL . '/relatorios2/view/statics/css/reqestilo.css';
$css2 = $baseURL . '/relatorios2/view/statics/css/reqestilo2.css';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL . '/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);


$arraySize = count($rows);

$titulo = " U.O. REITORIA - VEÍCULOS<br/>";
if ($idRequisicao != "") {
    $titulo .= "REQUISIÇÃO Nº: " . $idRequisicao;
} 

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="<?php echo $css; ?>" />
        <link rel="stylesheet" type="text/css" href="<?php echo $css2; ?>" />
        
        <script type="text/javascript" charset="utf-8">
            
        </script>
        
        <title><?php echo $titulo; ?></title>
    </head>
    <body>

<?php //ob_start();  ?>
        <div id="conteudo">

        <?php include_once '../statics/cabecalho.php'; ?>

            <div id="menu">
            </div>
            <table border="1" style="width: 100% !important;" >
                <tr>
                    <td style="text-align: center;">
                        <div class="faixa">
                            <h3>DESCRIÇÕES</h3></div>
            
             <table>     
            <tr>
                <td class="data" style="text-align: right;" width="20%" ><b>SITUAÇÃO:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['status']; ?></td>
            </tr>
                 
            <tr>
                <!--<td class="data">REQUISITANTE:</td>-->
                <td class="data" style="text-align: right;"><b>REQUISITANTE:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['realizada']; ?></td>
            </tr>
                 <?php if($status !=1){ ?>
            <tr>
                <!--<td class="data">RESPONSÁVEL:</td>-->
                <td class="data" style="text-align: right;"><b>RESPONSÁVEL:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['responsavel']; ?></td>
            </tr>
            <tr>
                <!--<td class="data">GESTOR:</td>-->
                <td class="data" style="text-align: right;"><b>GESTOR:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['gestor']; ?></td>
            </tr>
                 <?php
               if ($status == '7' || $status == 'A'|| $status == 'G' || $status == 'J') {
            ?>
            <tr>
                <!--<td class="data">EXECUTOR:</td>-->
                <td class="data" style="text-align: right;"><b>EXECUTOR:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rowse[0]['nome']; ?></td>
            </tr>
            <?php
               }
            ?>
            <tr>
                <!--<td class="data">QUANTIDADE DE VOLUME:</td>-->
                <td class="data" style="text-align: right;"><b>QUANTIDADE DE VOLUME:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['qtdvolume']; ?></td>
            </tr>
             
            <?php
            
               if ($rows[0]['qtdpassageiros'] != null) {
            ?>
            
            <tr>
                <!--<td class="data">QUANTIDADE DE PASSAGEIROS:</td>-->
                <td class="data" style="text-align: right;"><b>QUANTIDADE DE PASSAGEIROS:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['qtdpassageiros']; ?></td>
            </tr>
            
            <tr>
                <!--<td class="data">PASSAGEIROS:</td>-->
                <td class="data" style="text-align: right;"><b>PASSAGEIROS:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['outrospassageiros']; ?></td>
            </tr>
            <?php
               }
            ?>
            
            <tr>
                <!--<td class="data">FINALIDADE DA VIAGEM:</td>-->
                <td style="text-align: right;"><b>FINALIDADE DA VIAGEM:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['justificativa']; ?></td>
            </tr>
            
            <?php
                 }
               if ($rows[0]['obs'] != null) {
            ?>
            <tr>
                <!--<td class="valores" style="text-align: center;">OBSERVAÇÕES</td>-->
                <td class="valores" style="text-align: right;"><b>OBSERVAÇÕES:</b></td>
                <td class="valores" style="text-align: center;"><?php echo $rows[0]['obs']; ?></td>
            </tr>
            <?php
               }
            ?>
            <?php
               if ($status == '5' || $status == '6' || $status == 'A') {
            ?>
            
                
                <tr>
                    <!--<td style="text-align: center;">MOTIVO:</td>-->
                    <td style="text-align: right;"><b>MOTIVO:</b></td>
                    <td style="text-align: center;"><?php echo $rows[0]['motivorejeicao']; ?></td>
                </tr> 
             <?php
               }
            ?>
            <?php
               if ($status == '7' || $status == 'G' || $status == 'J') {
            ?>
                
                <tr>
                    <td style="text-align: right;"><b>MOTORISTA:</b></td>        
                    <td style="text-align: center;"><?php echo $rows[0]['motorista']; ?></td>
                </tr>
                <tr>
                    <td style="text-align: right;"><b>VEÍCULO:</b></td>        
                    <td style="text-align: center;"><?php echo $rows[0]['modeloplaca']; ?></td>
                </tr>
            <?php
               }
               if ($status == 'G') {
            ?>
                 
                 <tr>
                 <td style="text-align: right;"><b>TOTAL DE KM PECORRIDOS:</b></td>        
                 <td style="text-align: center;"><?php echo $rows[0]['odometrocheg'] - $rows[0]['odometrosaida']; ?></td>
                 </tr>
                 <?php
               }
            ?>
            </table></td></tr>
            </table>
            <?php
               if ($rowsi == '') {
            ?>
<br/>
          <table border="1" width="100%">
            <tr>
                    <td style="text-align: center;">
                        <div style="border-width:medium; border-color:#000" align="center">
                            <h3>ITINERÁRIO</h3></div> 
                        <table align="center"  width="100%" border="1">
                <tr> 
                    <td width="15%" style="text-align: left;"><b>DATA/HORA</b></td>
                    <td width="42,5%" style="text-align: center;"><b>ORIGEM<b/></td>
                    <td width="42,5%" style="text-align: center;"><b>DESTINO<b/></td>
                </tr>
            <?php
               for ($i = 0; $i < count($rowsi); $i++) {
            ?>   
                   <tr>
                            <td style="text-align: left;"><?php echo $rowsi[$i]['datasaida']; ?></td>
                            <td style="text-align: center;"><?php echo $rowsi[$i]['origem']; ?></td>
                            <td style="text-align: center;"><?php echo $rowsi[$i]['destino']; ?></td>
                </tr> 
                  <!-- <h3 align="left">HORÁRIO: <?php //echo $rowsi[$i]['datasaida']; ?>  ORIGEM: <?php //echo $rowsi[$i]['origem']; ?> - DESTINO: <?php //echo $rowsi[$i]['destino']; ?></h3>-->
                      
            <?php
               }
            ?>
                </table>
                    </td>
                </tr>
            </table>  
            <?php
            }
               if ($status == 'G' || $status == 'J') {
            ?>
<br/>
            <table width="100%" border="1">
                    <tr>
                        <td >
                            <div style="font-weight: bold;" align="center"><h3>SAIDA</h3></div>
                            <table border="1" width="100%">
                <tr>
                    <td style="text-align: center;">HORÁRIO:</td>        
                    <td style="text-align: center;"><?php echo $rows[0]['datahorasaidagar']; ?></td>
                    <td style="text-align: center;">ODÔMETRO:</td>        
                    <td style="text-align: center;"><?php echo $rows[0]['odometrosaida']; ?></td>
                </tr>
            </table>
            <?php
               }
            ?>
            <?php
               if ($status == 'G') {
            ?>
            </td>
            <td >
            <div style="font-weight: bold;" align="center"><h3>CHEGADA</h3></div>
                            <table border="1" width="100%">
                <tr>
                    <td style="text-align: center;">HORÁRIO:</td>        
                    <td style="text-align: center;"><?php echo $rows[0]['datahoracheggar']; ?></td>
                    <td style="text-align: center;">ODÔMETRO:</td>        
                    <td style="text-align: center;"><?php echo $rows[0]['odometrocheg']; ?></td>
                </tr>
            </table>
            
             <?php
               }
            ?>
            <?php
               if (count($rowsa)>0) {
            ?>
            </td>
                    </tr>
            </table>
            <table border="1" width="100%">
                        <tr>
                            <td style="text-align: center;">            
                                <div align="center" ><h3>ABASTECIMENTO</h3></div>
                                <table width="100%">
                <tr> 
                    <td width="18%" style="text-align: left;">DATA/HORA</td>
                    <td width="46%" style="text-align: center;">LOCAL</td>
                    <td width="19%" style="text-align: center;">VALOR</td>
                    <td width="17%" style="text-align: center;">ODOMETRO</td>
                </tr>
             <?php
               for ($j = 0; $j < count($rowsa); $j++) {
            ?>         
                <tr>
                            <td style="text-align: left;"><?php echo $rowsa[$j]['datahoraabastecimento']; ?></td>
                            <td style="text-align: center;"><?php echo $rowsa[$j]['local']; ?></td>
                            <td style="text-align: center;"><?php echo $rowsa[$j]['valorabastecimento']; ?></td>
                            <td style="text-align: center;"><?php echo $rowsa[$j]['odometro']; ?></td>
                </tr> 
                       <!--<h3 align="left"><?php //echo $rowsa[$j]['datahoraabastecimento']; ?>  LOCAL: <?php //echo $rowsa[$j]['local']; ?> VALOR: <?php //echo $rowsa[$j]['valorabastecimento']; ?> ODÔMETRO: <?php //echo $rowsa[$j]['odometro']; ?></h3>-->
                      
            <?php
               }
            ?>
            </table></td></tr></table>
            
             <?php
               }
            ?> 
        </div>
    </body>
</html>

<?php file_put_contents($tmpFile, ob_get_contents()); ?>

