<?php 
ob_start();

require_once '../../controller/Setor.php';
require_once '../../controller/DataHelper.php';

$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL.'/relatorios2/view/statics/css/estilo.css';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL.'/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);


$setor = $_GET['setor'];
//$processos = Setor::getProcessosByAllSetores();
// 11-10-2011 - Daniel Bonfim
$processos = Setor::getProcessosBySetor($setor);
//print_r($processos);exit;

$titulo = "RELATÓRIO DE PROCESSOS DO SETOR $setor";

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
                    
                    <label align="left">* Status: N - Normal / A - Arquivado</label>
                    <br/><br/>
                    
                    
                    <?php //foreach($processos as $chave=>$processo) {   ?>
                    
                        <table>
                            
                            <tr>
                                <th align="left"><?php echo $setor; ?></th>
                            </tr>
                                           
                            <tr>
                                <th class="descricao">Processo</th>
                                <th class="descricao">Origem</th>
                                <th class="descricao">Data de entrada</th>
                                <th class="descricao">Tempo parado</th>
                                <th class="descricao">Status</th>
                                <th class="descricao">Solicitante</th>
                                <th class="descricao">Título</th>
                                <th class="descricao">Assunto</th>
                            </tr>
                    
                    <?php foreach($processos as $proc) { ?>

                                <tr>
                                    <td class="valores"><?php echo $proc['processo']; ?></td>
                                    <td class="valores"><?php echo $proc['setororigem']; ?></td>
                                    <td class="data"><?php echo $proc['datahoraentrada']; ?></td>
                                    <td class="valores"><?php echo $proc['tempo_parado']; ?></td>
                                    <td class="valores"><?php echo $proc['situacao']; ?></td>
                                    <td class="descricao"><?php echo $proc['solicitante']; ?></td>
                                    <td class="valores"><?php echo $proc['titulo']; ?></td>
                                    <td class="descricao"><?php echo str_replace("/", "/ ", str_replace("720000195306151000", "720000195306151000 ", str_replace(".", ". ", str_replace(";", "; ", str_replace(",", ", ", $proc['assunto']))))); ?></td>                         
                                </tr>
                        
                    <?php } ?>
                        
                    </table>
                    <br/>
                    
		</div>
            
            
	</body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents());?>