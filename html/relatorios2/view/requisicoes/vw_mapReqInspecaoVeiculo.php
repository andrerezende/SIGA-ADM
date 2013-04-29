<?php
ini_set('memory_limit', '128M');
ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';
$idInspecao = $_GET['idInspecao'];
$status = $_GET['status'];
$idMotorista = $_GET['idMotorista'];
$datainicio = $_GET['datainicio'];
$idVeiculo = $_GET['idVeiculo'];
$idInspecao = $_GET['idIsntituicao'];
$arrData = explode('/', $datainicio);
$newDate = $arrData [2].'-'.$arrData [1].'-'.$arrData [0];


    
    

        $sql = "
SELECT ds_componente, f.ds_conformidade as c_inicio,f1.ds_conformidade as c_fim,ob_inicio, ob_fim, p.nome, v.modelo||' - '||v.placa as modeloplaca
  FROM vei_inspecao i 
inner join vei_inspecao_componente ic on i.id_inspecao = ic.id_inspecao 
  inner join vei_componente c on c.id_componente = ic.id_componente
inner join vei_conformidade f on f.id_conformidade = ic.id_conformidade_inicio  
  inner join vei_conformidade f1 on f1.id_conformidade = ic.id_conformidade_fim 
inner join ad_motorista m on i.id_motorista = m.idmotorista
  inner join cm_pessoa p on p.idpessoa = m.idpessoa 
inner join ad_veiculo v on i.id_veiculo = v.placa
where i.id_inspecao = $idInspecao ";




$sqli = "
SELECT p.nome
  FROM vei_inspecao i 
inner join ad_motorista m on i.id_motorista = m.idmotorista
  inner join cm_pessoa p on p.idpessoa = m.idpessoa 
where i.id_inspecao = $idInspecao ";

$sqla = "
SELECT v.modelo||' - '||v.placa as modeloplaca
  FROM vei_inspecao i 
inner join ad_veiculo v on i.id_veiculo = v.placa
  where i.id_inspecao = $idInspecao ";


try {
    $db = Conexao::getInstance()->getDB();

    $preparedStatment = $db->prepare($sql);
    $preparedStatment1 = $db->prepare($sqli);
    $preparedStatment2 = $db->prepare($sqla);
   // $preparedStatment3 = $db->prepare($sqle);


    $preparedStatment->execute();
    $preparedStatment1->execute();
    $preparedStatment2->execute();
    //$preparedStatment3->execute();

    $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
    $rowsi = $preparedStatment1->fetchAll(PDO::FETCH_ASSOC);
    $rowsa = $preparedStatment2->fetchAll(PDO::FETCH_ASSOC);
    //$rowse = $preparedStatment3->fetchAll(PDO::FETCH_ASSOC);

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

$titulo = " INSPEÇÃO DE  - VEÍCULOS<br/>";
$titulo .= "MOTORISTA: " . $rowsi[0]['nome'] ."<br/>";
$titulo .= "VEÍCULO: " . $rowsa[0]['modeloplaca'];
if ($idRequisicao != "") {
    $titulo .= "INSPEÇÃO Nº: " . $idRequisicao;
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
          <table border="1" width="100%">
            <tr>
                    <td style="text-align: center;">
                        <div style="border-width:medium; border-color:#000" align="center">
                            <h3>INSPEÇÃO DE N° <?php echo $idInspecao; ?></h3></div> 
                        <table align="center"  width="100%" border="1">
                <tr> 
                    <td width="25%" style="text-align: left;"><b>COMPONENTE</b></td>
                    <td width="15%" style="text-align: center;"><b>CONFORMIDADE INÍCIO<b/></td>
                    <td width="20%" style="text-align: center;"><b>OBS INÍCIO<b/></td>
                    <td width="15%" style="text-align: center;"><b>CONFORMIDADE FIM<b/></td>
                    <td width="20%" style="text-align: center;"><b>OBS: FIM<b/></td>
                </tr>
            <?php
               for ($i = 0; $i < count($rows); $i++) {
            ?>   
                   <tr>
                            <td style="text-align: left;"><?php echo $rows[$i]['ds_componente']; ?></td>
                            <td style="text-align: center;"><?php echo $rows[$i]['c_inicio']; ?></td>
                            <td style="text-align: center;"><?php echo $rows[$i]['ob_inicio']; ?></td>
                            <td style="text-align: center;"><?php echo $rows[$i]['c_fim']; ?></td>
                            <td style="text-align: center;"><?php echo $rows[$i]['ob_fim']; ?></td>
                </tr> 
                  <!-- <h3 align="left">HORÁRIO: <?php //echo $rowsi[$i]['datasaida']; ?>  ORIGEM: <?php //echo $rowsi[$i]['origem']; ?> - DESTINO: <?php //echo $rowsi[$i]['destino']; ?></h3>-->
                      
            <?php
               }
            ?>
                </table>
                    </td>
                </tr>
            </table>  
        
        </div>
    </body>
</html>

<?php file_put_contents($tmpFile, ob_get_contents()); ?>

