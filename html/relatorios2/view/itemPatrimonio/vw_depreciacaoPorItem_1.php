<?php
ob_start();
//ini_set('display_errors', 1);
require_once '../../controller/ItemPatrimonio.php';
include_once '../../controller/UtilitariosSiga.php';
require_once '../../controller/DataHelper.php';

$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL . '/relatorios2/view/statics/css/estilo.css';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL . '/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);

$mesRelatorio = $_GET['mesRelatorio'];
$idInstituicao = $_GET['idInstituicao'];
$instituicao = $_GET['instituicao'];
$idVidaUtil = $_GET['idVidaUtil'];
$situacao = $_GET['situacao'];

$contacontabil = "";

if ($idVidaUtil != "") {
    $contacontabil = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspConta Contábil: " . $idVidaUtil;
}
$titulo = "Relatório de Depreciação por Itens Patrimoniais";
$titulo.=" " . $situacao;

//die("$mesRelatorio // $idInstituicao // $instituicao // $idVidaUtil");

$itens = ItemPatrimonio::DepreciacaoPorItem($mesRelatorio, $idInstituicao, $idVidaUtil, $situacao);
//print_r($itens);exit;

$filtroInstituicao = ($instituicao) ? $instituicao : "Todas";

if (!$itens) {
    ?>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");
        history.go(-1);
    </script>
    <?
} else {



    $totalValorBruto = 0;
    $totalValorDepreciado = 0;
    $totalValorDepreciadoMes = 0;
    $totalValorResidual = 0;
    $totalValorLiquido = 0;
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
                        <th align="left"><?php echo "Periodo do relatório: " . substr($mesRelatorio, 3) . " - Instituição: $filtroInstituicao" . $contacontabil; ?></th>
                    </tr>
                </table>

                <table>
                    <tr>
                        <th class="data">Data de Aquisição</th>
                        <th class="descricao">Nº Tombo</th>
                        <th class="valores" style="width: 60%;">Item Patrimonial</th>
    <?php
    if ($situacao == 'Estornados') {
        echo "<th class='valores'>Data de Estorno</th>";
    }
    ?>
                        <th class="valores">Valor Bruto (R$)</th>
                        <th class="valores">Valor Depreciado (R$)</th>
                        <th class="valores">Valor Depreciado Mês (R$)</th>
                        <th class="valores">Valor Residual (R$)</th>
                        <th class="valores">Valor Líquido (R$)</th>
                    </tr>

                    <?php
                    for ($i = 0; $i < count($itens); $i++) {

                        $totalValorBruto += $itens[$i]['valor_bruto'];
                        $totalValorDepreciado += $itens[$i]['valordepreciado'];
                        $totalValorDepreciadoMes += $itens[$i]['valordepreciavelmes'];
                        $totalValorResidual += $itens[$i]['valorresidual'];
                        $totalValorLiquido += $itens[$i]['valorliquido'];

                        // valor residual = valor bruto * valor residual / 100
                        ?>
                        <tr>
                            <td class="valores"><?php echo UtilitariosSiga::dataFromBanco($itens[$i]['dataaquisicao']); ?></td>
                            <td class="valores"><?php echo $itens[$i]['iditempatrimonio']; ?></td>

                            <td class="valores"><?php echo str_replace("/", "/ ", str_replace(";", " ", str_replace(",", " ", $itens[$i]['item']))); ?></td>
                            <?php
                            $dataestorno = UtilitariosSiga::dataFromBanco($itens[$i]['datamovimento']);
                            if ($situacao == 'Estornados') {
                                echo "<td class='valores'>$dataestorno</td>";
                            }
                            ?>
                            <td class="valores"><?php echo number_format($itens[$i]['valor_bruto'], 2, ',', '.'); ?></td>
                            <td class="valores"><?php echo number_format($itens[$i]['valordepreciado'], 2, ',', '.'); ?></td>
                            <td class="valores"><?php echo number_format($itens[$i]['valordepreciavelmes'], 2, ',', '.'); ?></td>
                            <td class="valores"><?php echo number_format(($itens[$i]['valor_bruto'] * ($itens[$i]['valorresidual'] / 100)), 2, ',', '.'); ?></td>
                            <td class="valores"><?php echo number_format($itens[$i]['valorliquido'], 2, ',', '.'); ?></td>
                        </tr>

                        <?php } ?>

                    <tr>
                        <?php
                        if ($situacao == 'Estornados') {
                            echo "<th class='descricao' colspan='4'>Total</th>";
                        } else {
                            echo "<th class='descricao' colspan='3'>Total</th>";
                        }
                        ?>

                        <th class="totais"><?php echo number_format($totalValorBruto, 2, ',', '.'); ?></th>
                        <th class="totais"><?php echo number_format($totalValorDepreciado, 2, ',', '.'); ?></th>
                        <th class="totais"><?php echo number_format($totalValorDepreciadoMes, 2, ',', '.'); ?></th>
                        <th class="totais"><?php echo number_format($totalValorResidual, 2, ',', '.'); ?></th>
                        <th class="totais"><?php echo number_format($totalValorLiquido, 2, ',', '.'); ?></th>
                    </tr>

                </table>

            </div>


        </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents()); ?>

<?php
}