<?php
ob_start();
//ini_set('memory_limit', '128M');
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

//define('WP_MEMORY_LIMIT','100M');



$tombo=$_GET['tombo'];
$setorOrigem=$_GET['setororigem'];
$setorDestino=$_GET['setordestino'];

$datainicio=$_GET['datainicio'];
$datafim=$_GET['datafim'];

$instOrigem = $_GET['instOrigem'];
$instDestino = $_GET['instDestino'];

$sql="
	
	select TO_CHAR(m.data,'DD/MM/YYYY') as data,
	m.data as i,
	i.iditempatrimonio as tombo,
	i.descricao as descricao,
	s1.siglasetor as origem,
	s2.siglasetor as destino,
	u.login as login
	from ad_movimentopat m inner join ad_itempatrimonio i ON m.iditempatrimonio=i.iditempatrimonio
	LEFT JOIN cm_setor s1 on m.idsetororigem=s1.idsetor
	LEFT JOIN cm_setor s2 on m.idsetordestino=s2.idsetor
	LEFT JOIN cm_usuario u on m.idusuario=u.idusuario

	where m.tipomovimento='2'
	AND i.ativo='S' 

 ";


if($tombo || $setorOrigem  || $setorDestino || $datainicio || $datafim || $instOrigem || $instDestino){
	if ($tombo) {
		$sql.=" AND i.iditempatrimonio=$tombo";
	}
	if ($setorOrigem) {
		$sql.=" AND m.idsetororigem=$setorOrigem";
	}
	if ($setorDestino) {
		$sql.=" AND m.idsetordestino=$setorDestino" ;
	}
	if ($datainicio) {
		$sql.=" AND m.data >="."'".$datainicio."'" ;
	}
	if ($datafim) {
		$sql.=" AND m.data <="."'".$datafim."'" ;
	}
        if ($instOrigem) {
		$sql.=" AND s1.idinstituicao ="."'".$instOrigem."       '" ;
	}
        if ($instDestino) {
		$sql.=" AND s2.idinstituicao ="."'".$instDestino."       '" ;
	}

}

$sql.=" order by 2 DESC ,3 ";


try{
$db=Conexao::getInstance()->getDB();

$preparedStatment = $db->prepare($sql);


$preparedStatment->execute();


 $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
 //var_dump($rows);exit;
 //--------------------------------------------------setor Origem-------------------

 $db=Conexao::getInstance()->getDB();

 $sql2="select siglasetor from cm_setor where idsetor=$setorOrigem";



$preparedStatment = $db->prepare($sql2);


$preparedStatment->execute();


 $setorOrigem = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

 //------------------------------------------Setor Destino -------------------------------------------------


$db=Conexao::getInstance()->getDB();

 $sql3="select siglasetor from cm_setor where idsetor=$setorDestino";

$preparedStatment = $db->prepare($sql3);


$preparedStatment->execute();


 $setorDestino = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

 //-------------------------------------------------------------------------------------------------------------
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
	
    $titulo = "Relatório de Transferência de Itens Patrimoniais ";

	$titulo = "Relatório de Transferência de Itens Patrimoniais ";
if($tombo || $setorOrigem || $setorDestino || $datainicio || $datafim){
$filtro="Filtros: ";
}
if($tombo) {$filtrotombo="<br/>Tombo:&nbsp ".$tombo." ";}
if($setorOrigem){$filtrosetorOrigem="<br/>Setor de Origem:&nbsp ".$setorOrigem[0]['siglasetor']." ";}
if($setorDestino){$filtrosetorDestino="<br/>Setor de Destino:&nbsp".$setorDestino[0]['siglasetor']." ";}

if($datainicio){$filtrodatainicio="<br/>A partir de :&nbsp".$datainicio." ";}
if($datafim){$filtrodatafim="<br/>Até:&nbsp".$datafim." ";}


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
                                <th align="left"><?php echo "Filtros: <BR/> Itens Pesquisados: $arraySize"; ?></th>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <th class="data" style="width: 5%; text-align: center;">Data da Transferência</th>
                                <th class="descricao" style="width: 5%;text-align: center;">Tombo</th>
                                <th class="valores" style="width: 70%;text-align: center;">Descrição</th>
                                <th class="descricao" style="width: 5%;">Setor de Origem</th>
                                <th class="valores" style="width: 5%;">Setor de Destino</th>
                                <th class="valores" style="width: 10%;">Usuário</th>
                              
                            </tr>

			<?php
			$arraySize = count($rows);
			for($i=0; $i<$arraySize; $i++) {

                            // valor residual = valor bruto * valor residual / 100
			 ?>
                            <tr>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['data']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['tombo']; ?></td>
                                <td class="valores" style="width: 70%;text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['origem']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['destino']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['login']; ?></td>
                                

                            </tr>

                            <?php }
							unset($rows);?>


                       </table>

                    </div>


            </body>
    </html>
	
    <?php file_put_contents($tmpFile, ob_get_contents());?>



<?php
