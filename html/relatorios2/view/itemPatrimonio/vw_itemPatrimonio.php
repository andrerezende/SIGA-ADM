<?php
ob_start();

ini_set('display_errors', 1);
require_once '../../controller/ItemPatrimonio.php';
require_once '../../controller/DataHelper.php';

$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL.'/relatorios2/view/statics/css/estilo.css';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL.'/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);

$filtradoPor = $_GET['filtradoPor'];
$idSetor = $_GET['idSetor'];
$idInstituicao = $_GET['idInstituicao'];
$idVidautil = $_GET['idVidaUtil'];
$numeroEmpenho = $_GET['numeroEmpenho'];
$cnpj = $_GET['cnpj'];
$orderby = $_GET['orderby'];

$itens = ItemPatrimonio::ItemPatrimonioBy($idSetor, $idInstituicao, $idVidautil, $numeroEmpenho, $cnpj, $orderby);

if($filtradoPor == "instituicao")
    $filtro = "Instituição: ".$itens[0]['instituicao'];
else if($filtradoPor == "setor")
    $filtro = "Setor: ".$itens[0]['siglasetor'];
else if($filtradoPor == "vidautil")
    $filtro = "Conta contábil: ".$itens[0]['idvidautil'];
else if($filtradoPor == "empenho")
    $filtro = "Número Empenho: ".$itens[0]['numeroempenho'];
else if($filtradoPor == "cnpj")
    $filtro = "CNPJ: ".$itens[0]['cnpj'];
else
    $filtro = "nao definido";

echo $itens[0]['idInstituicao'];

if(!$itens) {
    ?>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");
        history.go(-1);
    </script>
    <?
} else {

    $titulo = "Relatório de Itens Patrimoniais";
    $valorTotal = 0;

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

                    <div id="conteudo">

                        <?php include_once '../statics/cabecalho.php'; ?>

                        <div id="menu">
                            <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                            <a href="<?php echo $url; ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                        </div>

                        <table>
                            <tr>
                                <th align="left"><?php echo $filtro; ?></th>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <th class="valores">Nº Tombo</th>
                                <th class="descricao">Descrição</th>
                                <th class="valores">Valor (R$)</th>
                                <th class="valores">C. Contábil</th>
                                <th class="valores">Setor</th>
                                <th class="valores">Nº Empenho</th>
                                <th class="valores">NF</th>
                                <th class="data">Data Ateste</th>
                                <th class="data">Data de Aquisição</th>
                                <th class="data">Data de início de uso</th>
                            </tr>

                        <?php for($i=0; $i<count($itens); $i++) {

                            $valorTotal += $itens[$i]['itempat_valor'];?>

                            <tr>
                                <td class="valores"><?php echo $itens[$i]['iditempatrimonio']; ?></td>
                                <td class="descricao"><?php echo str_replace("/", " ", str_replace(";", " ", str_replace(",", " ", $itens[$i]['itempat_descricao']))); ?></td>
                                <td class="valores"><?php echo number_format($itens[$i]['itempat_valor'], 2, ',', '.'); ?></td>
                                <td class="valores"><?php echo $itens[$i]['idvidautil']; ?></td>
                                <td class="valores"><?php echo $itens[$i]['siglasetor']; ?></td>
                                <td class="valores"><?php echo $itens[$i]['numeroempenho']; ?></td>
                                <td class="valores"><?php echo $itens[$i]['notafiscal']; ?></td>
                                <td class="data"><?php echo $itens[$i]['dataateste']; ?></td>
                                <td class="data"><?php echo $itens[$i]['dataaquisicao']; ?></td>
                                <td class="data"><?php echo $itens[$i]['datainiciouso']; ?></td>
                            </tr>

                            <?php } ?>

                            <tr>
                                <th class="descricao" colspan="2">Total</th>
                                <th class="totais"><?php echo number_format($valorTotal, 2, ',', '.'); ?></th>
                                <th class="totais" colspan="7"></th>
                            </tr>

                       </table>

                    </div>

            </body>
    </html>
    <?php file_put_contents($tmpFile, ob_get_contents());?>

<?php }