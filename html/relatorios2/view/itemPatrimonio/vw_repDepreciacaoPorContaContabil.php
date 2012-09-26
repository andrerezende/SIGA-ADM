<?php
ini_set('memory_limit', '128M');
ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

//define('WP_MEMORY_LIMIT','100M');
//echo "relatorios2/view/itemPatrimonio/vw_repDepreciacaoPorContaContabil.php?idusuario=$idUsuario&idInstituicao=$idInstituicao&unidade=$unidade&mesReferencia=$mesReferencia&anoReferencia=$anoReferencia&situacao=$situacao&mesRelatorio=$mesRelatorio";

$idUsuario = $_GET['idusuario'];
$idInstituicao = $_GET['idInstituicao'];
$unidade = $_GET['unidade'];
$mesReferencia = $_GET['mesReferencia'];
$anoReferencia = $_GET['anoReferencia'];
$situacao = $_GET['situacao'];
$mesRelatorio = $_GET['mesRelatorio'];
$retrato = $_GET['retrato'];

if ($situacao == 'Estornados') {
    $situacao = '';
} else {
    $situacao = 'NOT';
}

if ($retrato == 2) {
    $sql = "
SELECT
idrubrica as contacontabil,
SUM(valor) as valor_bruto,

SUM(CASE extract(day from iniciouso) WHEN 1 THEN
CASE (((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao OR
((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) = 0) WHEN true THEN
0
ELSE
valordepreciavelmes
END
ELSE
CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao OR
extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)) = 0) WHEN true THEN
0
ELSE
valordepreciavelmes
END
END) as valordepreciavelmes,


SUM((valordepreciavelmes *
CASE extract(day from iniciouso) WHEN 1 THEN
CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1)
END
ELSE
CASE (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
(extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))
END
END)) as valordepreciado,

SUM((valor - (valordepreciavelmes *
CASE extract(day from iniciouso) WHEN 1 THEN
CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1)
END
ELSE
CASE (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
(extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))
END
END))) as valorLiquido

FROM vw_depreciacao
WHERE iniciouso < date('$mesRelatorio')
AND vw_depreciacao.iditempatrimonio $situacao IN
(select
iditempatrimonio
from ad_movimentopat where tipomovimento='4'
)
GROUP BY
idrubrica
ORDER BY
idrubrica;
";
} else {
    $sql = "SELECT
idrubrica as contacontabil,
SUM(valor) as valor_bruto,

SUM(CASE extract(day from iniciouso) WHEN 1 THEN
CASE (((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao OR
((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) = 0) WHEN true THEN
0
ELSE
valordepreciavelmes
END
ELSE
CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao OR
extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)) = 0) WHEN true THEN
0
ELSE
valordepreciavelmes
END
END) as valordepreciavelmes,


SUM((valordepreciavelmes *
CASE extract(day from iniciouso) WHEN 1 THEN
CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1)
END
ELSE
CASE (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
(extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))
END
END)) as valordepreciado,

SUM((valor - (valordepreciavelmes *
CASE extract(day from iniciouso) WHEN 1 THEN
CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1)
END
ELSE
CASE (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao WHEN true THEN
mesesdepreciacao
ELSE
(extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))
END
END))) as valorLiquido

FROM vw_depreciacao
WHERE iniciouso < date('$mesRelatorio') and cast(idinstituicao as integer) = '$idInstituicao'
AND vw_depreciacao.iditempatrimonio $situacao IN
(select
iditempatrimonio
from ad_movimentopat where tipomovimento='4'
)


GROUP BY
idrubrica
ORDER BY
idrubrica;";
}


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
$css = $baseURL . '/relatorios2/view/statics/css/estilo.css';

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

$titulo = " Relatório de Depreciação Por Conta Contábil - ";

if ($situacao == 'NOT') {
    $titulo.="Somente de Itens Ativos";
} else {
    $titulo.="Somente de Itens Estornados";
}


if ($mesRelatorio || $Instituicao) {
    $filtro = "Filtros: ";
}
if ($mesRelatorio) {
    $filtromRelatorio = "<br/>Período do Relatório:&nbsp " . $mesRelatorio . " ";
}
if ($unidade) {
    $filtroInstituicao = "<br/>Instituição:&nbsp IFBAIANO - " . $unidade . " ";
} else {
    $filtroInstituicao = "<br/>Todas as Unidades";
}
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

<?php //ob_start();  ?>
        <div id="conteudo">

        <?php include_once '../statics/cabecalho.php'; ?>

            <div id="menu">
                <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                <a href="<?php echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
            </div>

            <table>
                <tr>
                    <th align="left"><?php echo "Filtros: <br/> Itens Pesquisados: $arraySize <BR/> $filtromRelatorio <br/>$filtroInstituicao"; ?></th>
                </tr>
            </table>

            <table>
                <tr>
                    <th class="data" style="width: 5%; text-align: center;">Conta Contábil</th>
                    <th class="descricao" style="width: 5%;text-align: center;">Valor Bruto(R$)</th>
                    <th class="valores" style="width: 4%;text-align: center;">Valor Depreciado(R$)</th>
                    <th class="descricao" style="width: 5%;">Valor Depreciado Mês(R$)</th>
                    <th class="valores" style="width: 5%;">Valor Líquido(R$)</th>


                </tr>

<?php
$arraySize = count($rows);
for ($i = 0; $i < $arraySize; $i++) {

    $totalValorBruto += $rows[$i]['valor_bruto'];
    $totalValorDepreciado += $rows[$i]['valordepreciado'];
    $totalValorDepreciadoMes += $rows[$i]['valordepreciavelmes'];
    $totalValorLiquido += $rows[$i]['valorliquido'];
    ?>
                    <tr>
                        <td class="valores" style="text-align: center;"><?php echo $rows[$i]['contacontabil']; ?></td>
                        <td class="valores" style="text-align: center;"><?php echo number_format($rows[$i]['valor_bruto'], 2, ',', '.'); ?></td>
                        <td class="valores" style="width: 4%;text-align: center;"><?php echo number_format($rows[$i]['valordepreciado'], 2, ',', '.'); ?></td>
                        <td class="valores" style="text-align: center;"><?php echo number_format($rows[$i]['valordepreciavelmes'], 2, ',', '.'); ?></td>
                        <td class="valores" style="text-align: center;"><?php echo number_format($rows[$i]['valorliquido'], 2, ',', '.'); ?></td>

                    </tr>

<?php }
unset($rows);
?>
                <tr>
                    <th class="descricao" style="width: 5%; text-align: center;">Total</th>
                    <th class="totais"><?php echo number_format($totalValorBruto, 2, ',', '.'); ?></th>
                    <th class="totais"><?php echo number_format($totalValorDepreciado, 2, ',', '.'); ?></th>
                    <th class="totais"><?php echo number_format($totalValorDepreciadoMes, 2, ',', '.'); ?></th>
                    <th class="totais"><?php echo number_format($totalValorLiquido, 2, ',', '.'); ?></th>
                </tr>
            </table>

        </div>


    </body>
</html>

<?php file_put_contents($tmpFile, ob_get_contents()); ?>



<?php
