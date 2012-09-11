<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];
$instituicoes=$_GET['instituicoes'];
$inst=$_GET['inst'];



$sql="
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
       (cm_setor.idinstituicao in $inst))

ORDER BY ad_itempatrimonio.iditempatrimonio ASC";

try{
    $db=Conexao::getInstance()->getDB();
    $preparedStatment = $db->prepare($sql);
    $preparedStatment->execute();

    $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
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
    $titulo = "RELATORIO DE BAIXAS DE ".$datainicio." A ".$datafim;



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
                                <th align="left"><?php echo "Relatório de baixas: $instituicoes<BR/> Itens Pesquisados: $arraySize"; ?></th>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <th class="data" style="width: 5%; text-align: center;">Classificador</th>
                                <th class="descricao" style="width: 5%; text-align: center;">N. Pat</th>
                                <th class="valores" style="width: 40%; text-align: center;">Descrição</th>
                                <th class="descricao" style="width: 10%; text-align: center;">Setor</th>
                                <th class="valores" style="width: 10%; text-align: center;">Valor</th>
                                <th class="descricao" style="width: 10%; text-align: center;">Motivo</th>
                                <th class="valores" style="width: 5%; text-align: center;">Data Aquisição</th>
								<th class="descricao" style="width: 5%; text-align: center;">Data Baixa</th>
								<th class="valores" style="width: 5%; text-align: center;">Processo</th>
                            </tr>

			<?php
			$arraySize = count($rows);
			for($i=0; $i<$arraySize; $i++) {

                            // valor residual = valor bruto * valor residual / 100
			 ?>
                            <tr>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['idclassificador']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['npat']; ?></td>
                                <td class="valores" style="text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['setor']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['valor']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['motivo']; ?></td>
                                <td class="valores" style="text-align: center;"><?php echo $rows[$i]['dataaquisicao']; ?></td>
								<td class="valores" style="text-align: center;"><?php echo $rows[$i]['databaixa']; ?></td>
								<td class="valores" style="text-align: center;"><?php echo $rows[$i]['nump']; ?></td>

                            </tr>

                            <?php } ?>


                       </table>

                    </div>


            </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents());?>

<?php
