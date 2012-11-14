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

$setor = $_GET['setor'];
$users = Setor::getNameAndNickBySetor($setor);

if(!$users) {
    ?>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");  
        history.go(-1);
    </script> 
    <?
} else {
    

$titulo = "RELATÓRIO DE TODOS OS SERVIDORES DO SETOR<br/> $setor";

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
                                <th align="left"><?php echo $setor; ?></th>
                            </tr>
                        </table>
                    
                    <table>
                        <tr>
                            <th class="descricao">Nome</th>
                            <th class="descricao">Usuário</th>
                        </tr>
                    
                    <?php foreach($users as $user) {  ?>

                            <tr>
                                <td class="descricao"><?php echo $user['nome']; ?></td>
                                <td class="descricao"><?php echo $user['login']; ?></td>
                            </tr>
                                                
                    <?php } ?>
                        
                    </table>
                    	
		</div>
	</body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents());?>

<? } 