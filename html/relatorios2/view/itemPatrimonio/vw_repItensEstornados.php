<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$notafiscal = $_GET['notafiscal'];
$descricao = $_GET['descricao'];
$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$ativo=$_GET['ativo'];



$sql="
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

if($notafiscal || $descricao  || $datainicio || $datafim || $ativo){
	if ($notafiscal) {
		$sql.=" AND a.notafiscal like '%$notafiscal%'";
	}
	if ($descricao) {
		$sql.=" AND i.descricao like '%$descricao%'";
	}
	if ($datainicio) {
		$sql.=" AND i.dataaquisicao >="."'".$datainicio."'" ;
	}
	if ($datafim) {
		$sql.=" AND i.dataaquisicao <="."'".$datafim."'" ;
	}
	if ($ativo) {
		$sql.="  AND cast(i.ativo as text) ="."'".$ativo."'";
	}
}
$sql.=" order by i.dataaquisicao, a.notafiscal ";

try{
$db=Conexao::getInstance()->getDB();

$preparedStatment = $db->prepare($sql);


$preparedStatment->execute();


 $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
 //var_dump($rows);exit;
 Conexao::getInstance()->disconnect();

} catch(Exception $e) {
	$e->getMessage();
}
  
 
 $dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL.'/relatorios2/view/statics/css/estilo.css';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL.'/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);



//echo $dnotafiscal = $_GET['notafiscal'];



//die("$mesRelatorio // $idInstituicao // $instituicao // $idVidaUtil");

		
		
//print_r($itens);exit;



/*if(!$itens) {
    ?>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");
        history.go(-1);
    </script>
    <?
} else {*/
    $arraySize = count($rows);
    $titulo = "Relatório de Itens Estornados ";

    

    ?>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
    <html>
            <head>
                    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
                    <link rel="stylesheet" type="text/css" href="<?php echo $css; ?>" />
                    <title><?php echo $titulo; ?></title>
            </head>
            <body>

                <?php //ob_start(); ?>
                    <div id="conteudo">

                        <?php include_once '../statics/cabecalho.php'; ?>

                        <div id="menu">
                            <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                            <a href="<?php echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                        </div>

                        <table>
                            <tr>
                                <th align="left"><?php echo "Relatório de Itens Estornados <BR/> Itens Pesquisados: $arraySize"; ?></th>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <th class="data">Data de Aquisição</th>
                                <th class="descricao">Nº Tombo</th>
                                <th class="valores">Item Patrimonial</th>
                                <th class="descricao">Marca</th>
                                <th class="valores">Valor Bruto(R$)</th>
                                <th class="descricao">Sigla</th>
                                <th class="valores">Nota Fiscal</th>
                            </tr>

			<?php
			$arraySize = count($rows);
			for($i=0; $i<$arraySize; $i++) {

                            // valor residual = valor bruto * valor residual / 100
			 ?>
                            <tr>
                                <td class="valores"><?php echo $rows[$i]['dataaquisicao']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['iditempatrimonio']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['descricao']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['marcamodelo']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['valor']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['siglasetor']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['notafiscal']; ?></td>
                               
                            </tr>

                            <?php } ?>
						

                       </table>

                    </div>


            </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents());?>

<?php 
