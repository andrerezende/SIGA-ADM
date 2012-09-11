<?php 
ob_start();
//ini_set('display_errors', 1);
require_once '../../controller/Setor.php';
require_once '../../controller/DataHelper.php';

$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css = $baseURL.'/relatorios2/view/statics/css/estilo.css';

// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL.'/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);

$arrTratado = Setor::getNameAndNickFromAllSetores();

$setores = $arrTratado['setores'];
$rows = $arrTratado['rows'];

$titulo = "RELATÓRIO DE USUÁRIOS POR SETOR";

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
                    
                    <?php foreach($setores as $setor) {   ?>
                    
                        <table>
                            <tr>
                                <th class="descricao"><?php echo $setor; ?></th>
                            </tr>
                        </table>
                    
                    <table>
                        <tr>
                            <th class="descricao">Nome</th>
                            <th class="descricao">Usuário</th>
                        </tr>
                    
                    <?php foreach($rows as $row) { 
                        if($setor == $row['siglasetor']) {
                        ?>

                            <tr>
                                <td class="descricao"><?php echo $row['nome']; ?></td>
                                <td class="descricao"><?php echo $row['login']; ?></td>
                            </tr>
                                                
                        <?php } ?>
                    <?php } ?>
                        
                    </table>
                    
                    <br/>
                    
                <?php } ?>
			
		</div>
            
            
	</body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents());?>