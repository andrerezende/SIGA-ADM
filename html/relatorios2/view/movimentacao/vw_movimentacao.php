<?php 
ob_start();

//ini_set('display_errors', 1);

require_once '../../controller/Movimentacao.php';
require_once '../../controller/UtilitariosSiga.php';
require_once '../../controller/DataHelper.php';

$dataHelper = new DataHelper();
$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL.'/relatorios2/view/statics/css/estilo.css';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL.'/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);

/*
// Url utilizada no link de impressão do relatório.
$url = $baseURL.'/relatorios2/PRINT_PDF/print_pdf.php?input_file=' .
		rawurlencode($tmpFile) . '&paper=letter&output_file=' .
		rawurlencode(pathinfo(basename(__FILE__), PATHINFO_FILENAME) . '.pdf');
 * 
 */


$filtradoPor = $_GET['filtradoPor'];
$idNotaFiscal = $_GET['idNotaFiscal'];
$notaFiscal = $_GET['notaFiscal'];
$descricaoSubElemento = $_GET['descricaoSubElemento'];
$idSubElemento = $_GET['idSubElemento'];
$siglaUo = $_GET['siglaUo'];
$idUo = $_GET['idUo'];
$dataInicio = $_GET['dataInicio'];
$dataFim = $_GET['dataFim'];

//print_r($rows);exit;
$rows = null;

if($filtradoPor == "SUB ELEMENTO")  {
    $filtro = "Descrição SubElemento: $descricaoSubElemento / Sigla U.O.: $siglaUo";   
    $rows = Movimentacao::MovimentacaoPorSubelemento($idNotaFiscal, $idSubElemento, $idUo, $dataInicio, $dataFim);
    
} else if ($filtradoPor == "NOTA FISCAL") {
    $filtro = "NOTA FISCAL: $notaFiscal";
    $rows = Movimentacao::MovimentacaoPorNotaFiscal($notaFiscal, $idUo, $dataInicio, $dataFim);
    
}
    

if($dataInicio) 
    $filtro .= " de ". $dataInicio;
if($dataFim) 
    $filtro .= " até ".$dataFim;
 
        
    $titulo = "Relatório de Movimentação por $filtradoPor";
    //$url = "../../PRINT_PDF/movimentacao/pdf_movimentacao.php?filtradoPor=$filtradoPor&idNotaFiscal=$idNotaFiscal&notaFiscal=$notaFiscal&descricaoSubElemento=$descricaoSubElemento&idSubElemento=$idSubElemento&siglaUo=$siglaUo&idUo=$idUo&dataInicio=$dataInicio&dataFim=$dataFim";

if(!$rows) {    
    ?>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");  
        history.go(-1);
    </script> 
    <?
} else {
    
    ?>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
    <html>
            <head>
                    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
                    <link rel="stylesheet" type="text/css" href="<?php echo $css; ?>" />
                    <title><?php echo strtoupper($titulo); ?></title>
            </head>
            <body>

                    <div id="conteudo">
                        <?php require_once '../statics/cabecalho.php'; ?>

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
                                <th class="valores">ID</th>
                                <th class="valores">Tipo</th>
                                <th class="valores">ID Material</th>
                                <th class="descricao">Material</th>
                                <th class="data">Data</th>
                                <th class="valores">Quantidade</th>
                                <th class="valores">Valor Total (R$)</th>
                                <th class="valores">ID Requisição</th>                                
                                <th class="valores">ID Movimento Ref.</th>
                            </tr>
                            
                            <? 
                            $sumQuantidade = 0;
                            $sumValorTotal = 0;
                            ?>
                            
                        <?php for($i=0; $i<count($rows); $i++) {
                            
                            $sumQuantidade += $rows[$i]['quantidade'];
                            $sumValorTotal += $rows[$i]['valortotal'];
                            ?>
                            
                            <tr>
                                <td class="valores"><?php echo $rows[$i]['idmovimento']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['tipomovimento']; ?></td>
                                <td class="valores"><?php echo $rows[$i]['idmaterial']; ?></td>
                                <td class="descricao"><?php echo str_replace("/", "/ ", str_replace("-", "- ", str_replace(".", ". ", str_replace(",", ", ", $rows[$i]['descricao_mat'])))); ?></td>
                                <td class="data"><?php echo UtilitariosSiga::dataFromBanco($rows[$i]['datamov']); ?></td>
                                <td class="valores"><?php echo $rows[$i]['quantidade']; ?></td>
                                <td class="valores"><?php echo number_format($rows[$i]['valortotal'], 2, ',', ','); ?></td>
                                <td class="valores"><?php echo $rows[$i]['idrequisicao']; ?></td>                                
                                <td class="valores"><?php echo $rows[$i]['idmovimentoref']; ?></td>
                            </tr>
                            
                            <?php } ?>
                            
                            <tr>
                                <th class="descricao">Total</th>
                                <th class="descricao"></th>
                                <th class="totais valores"></th>
                                <th class="totais valores"></th>
                                <th class="data"></th>
                                <th class="totais valores"><?php echo $sumQuantidade; ?></th>
                                <th class="totais valores"><?php echo number_format($sumValorTotal, 2, ',', ','); ?></th>
                                <th class="totais valores"></th>                                
                                <th class="totais valores"></th>
                            </tr>
                            
                       </table>
                        
                    </div>

            </body>
    </html>
    
    <?php file_put_contents($tmpFile, ob_get_contents());?>

<?php }