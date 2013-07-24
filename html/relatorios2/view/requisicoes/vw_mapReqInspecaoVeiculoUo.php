<?php
ini_set('memory_limit', '128M');
ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';
//$idMotorista = $_GET['idMotorista'];
//$datainicio = $_GET['datainicio'];
//$idVeiculo = $_GET['idVeiculo'];
$idInspecao = $_GET['idInspecao'];
$idSituacaoInspecao = $_GET['idSituacaoInspecao'];
$conformidade = $_GET['conformidade'];
$iduo = $_GET['iduo'];
//$arrData = explode('/', $datainicio);
//$newDate = $arrData [2].'-'.$arrData [1].'-'.$arrData [0];


    
 if($idSituacaoInspecao == 5) {  

        $sql = "
SELECT ds_componente, f.ds_conformidade as c_inicio,f1.ds_conformidade as c_fim,ob_inicio, ob_fim, p.nome, v.modelo||' - '||v.placa as modeloplaca, confirmacao, confirmacaofinal
  FROM vei_inspecao i 
inner join vei_inspecao_componente ic on i.id_inspecao = ic.id_inspecao 
  inner join vei_componente c on c.id_componente = ic.id_componente
inner join vei_conformidade f on f.id_conformidade = ic.id_conformidade_inicio  
  inner join vei_conformidade f1 on f1.id_conformidade = ic.id_conformidade_fim 
inner join ad_motorista m on i.id_motorista = m.idmotorista
  inner join cm_usuario us on us.idusuario = m.idusuario   
inner join cm_pessoa p on p.idpessoa = us.idpessoa 
  inner join ad_veiculo v on i.id_veiculo = v.placa
where i.id_inspecao = $idInspecao and i.id_uo = $iduo";
}else
if($idSituacaoInspecao == 3) {
    $sql = "
SELECT ds_componente, f.ds_conformidade as c_inicio,ob_inicio, ob_fim, p.nome, v.modelo||' - '||v.placa as modeloplaca,confirmacao
  FROM vei_inspecao i 
inner join vei_inspecao_componente ic on i.id_inspecao = ic.id_inspecao 
  inner join vei_componente c on c.id_componente = ic.id_componente
inner join vei_conformidade f on f.id_conformidade = ic.id_conformidade_inicio 
inner join ad_motorista m on i.id_motorista = m.idmotorista
  inner join cm_usuario us on us.idusuario = m.idusuario   
inner join cm_pessoa p on p.idpessoa = us.idpessoa  
inner join ad_veiculo v on i.id_veiculo = v.placa
where i.id_inspecao =$idInspecao and i.id_uo = $iduo";
}elseif($idSituacaoInspecao == 4) {  

        $sql = "
SELECT ds_componente, f.ds_conformidade as c_inicio,f1.ds_conformidade as c_fim,ob_inicio, ob_fim, p.nome, v.modelo||' - '||v.placa as modeloplaca, confirmacao, confirmacaofinal
  FROM vei_inspecao i 
inner join vei_inspecao_componente ic on i.id_inspecao = ic.id_inspecao 
  inner join vei_componente c on c.id_componente = ic.id_componente
inner join vei_conformidade f on f.id_conformidade = ic.id_conformidade_inicio  
  inner join vei_conformidade f1 on f1.id_conformidade = ic.id_conformidade_fim 
inner join ad_motorista m on i.id_motorista = m.idmotorista
  inner join cm_usuario us on us.idusuario = m.idusuario   
inner join cm_pessoa p on p.idpessoa = us.idpessoa 
  inner join ad_veiculo v on i.id_veiculo = v.placa
where i.id_inspecao = $idInspecao and i.id_uo = $iduo";
}

$sqli = "
SELECT p.nome
  FROM vei_inspecao i 
inner join ad_motorista m on i.id_motorista = m.idmotorista
  inner join cm_usuario us on us.idusuario = m.idusuario   
inner join cm_pessoa p on p.idpessoa = us.idpessoa  
where i.id_inspecao = $idInspecao and i.id_uo = $iduo";

$sqla = "
SELECT v.modelo||' - '||v.placa as modeloplaca
  FROM vei_inspecao i 
inner join ad_veiculo v on i.id_veiculo = v.placa
  where i.id_inspecao = $idInspecao and i.id_uo = $iduo";


try {
    $db = Conexao::getInstance()->getDB();

    $preparedStatment = $db->prepare($sql);
    $preparedStatment1 = $db->prepare($sqli);
    $preparedStatment2 = $db->prepare($sqla);
    //$preparedStatment3 = $db->prepare($sqlini);


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
//$exc = 'http://127.0.0.1//index.php?module=adm&action=inspecao:loginmot';
if($conformidade == 1){
$server = $_SERVER['SERVER_NAME']; 
$exc = 'http://'.$server.'//index.php?module=adm&action=inspecao:loginmot';
}
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
        <script>
function open_win()
{
window.open("http://www.w3schools.com")
}
</script>
        
        <title><?php echo $titulo; ?></title>
    </head>
    <body>

<?php //ob_start();  ?>
        <div id="conteudo">

        <?php include_once '../statics/cabecalho.php'; ?>
            <?php if($conformidade == 1){?>
            <div id="menu">
                <a href="<?php echo $exc; ?>" target="_parent">Conformidade do Motorista <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
            </div>
            <?php }?>
            <div id="menu">
            </div>
          <table border="1" width="100%">
            <tr>
                <?php switch($rows[5]['confirmacao']){
                    case 1:
                        $con = 'INSPEÇÃO de saída NÃO AVALIADA pelo motorista';
                        break;
                    case 2:
                        $con = 'INSPEÇÃO de saída CONFIRMADA pelo motorista';
                        break;
                    case 3:
                        $con = 'INSPEÇÃO de saída NÃO CONFIRMADA pelo motorista';
                        break;
                    default:
                        $con = 'INSPEÇÃO de saída NÃO AVALIADA pelo motorista';
                        break;
                ?>
            <?php }?>
                <?php if($rows[5]['confirmacaofinal']){
                    switch($rows[5]['confirmacaofinal']){
                    case 1:
                        $conf = 'INSPEÇÃO de chegada NÃO AVALIADA pelo motorista';
                        break;
                    case 2:
                        $conf = 'INSPEÇÃO de chegada CONFIRMADA pelo motorista';
                        break;
                    case 3:
                        $conf = 'INSPEÇÃO de chegada NÃO CONFIRMADA pelo motorista';
                        break;
                    default:
                        $conf = 'INSPEÇÃO de chegada NÃO AVALIADA pelo motorista';
                        break;
                }?>
            <?php }?>
                    <td style="text-align: center;">
                        <div style="border-width:medium; border-color:#000" align="center">
                            <h3>INSPEÇÃO DE N° <?php echo $idInspecao; ?></h3>
                            <h3><?php echo $con; ?></h3>
                            <h3><?php echo $conf; ?></h3>
                        </div> 
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

