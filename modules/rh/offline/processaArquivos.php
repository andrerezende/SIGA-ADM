<?PHP
/* Copyright 2006, 2007, 2008, 2009, 2010 do SETEC/MEC
 *
 * Este arquivo é parte do programa SigaEPT
 *
 * O SigaEPT é um software livre;  você pode redistribuí-lo e/ou modificá-lo dentro dos
 * termos da Licença Pública Geral GNU como publicada pela fundação do software livre (FSF);
 * na versão 2 da Licença.
 *
 * Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA GARANTIA; sem
 * uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja Licença
 * Pública Geral GNU/GPL em português para maiores detalhes.
 *
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título “LICENCA.txt”,
 * junto com este programa, se não, acesse o portal do Software Público Brasileiro no endereço
 * www.softwarepublico.gov.br ou escreva para Fundação do Software Livre (FSF) Inc.,51 Franklin
 * St, Fifth Floor, Boston, MA 02110-1301, USA
 */

/*

select IDARQUIVO, MD5, NOME, CAMINHO, TAMANHO, MESREFERENCIA, ANOREFERENCIA, IDUSUARIO              
       DATAGRAVACAO, DATAPROCESSAMENTO, NOMEARQLOG, CAMINHOARQLOG, SCRIPTPROCESSAMENTO, CAMINHOSCRIPT
  from cm_arquivo
  where  SCRIPTPROCESSAMENTO = 'importServidor.php';
  order by 1;

where CAMINHO like '%integracaosiape%'
  order by 1;

select CAMINHO,DATAPROCESSAMENTO d, SCRIPTPROCESSAMENTO, CAMINHOSCRIPT from cm_arquivo where IDARQUIVO=901;

*/

ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");
//error_reporting(0);

//Nao esquecer de alterar os caminhos quando "commitar".
//$path = "/home/jefferson/miolo/";
$path = "/usr/local/siga2/";
chdir("{$path}classes");
include_once "{$path}classes/miolo.class";
include_once "{$path}classes/support.inc";

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);
$MIOLO->setConf('logs.port','0');

echo("\n\n".date("d/m/Y H:i:s")." - INICIO DO PROCESSA ARQUIVO.");

TRY
{
	$arquivo = $MIOLO->GetBusiness('common','arquivo');
	  $array = array('siapefitaesp','f-esp-pensao');    
    $query = $arquivo->ListNaoProcessados(FALSE,$array);  //naoretornaconteudo = TRUE: naõ retorna coluna $conteudo tipo blob   
    $listaArquivos = $query->result;    
    echo ("\n\t RH: processaArquivos.php: ".date("d/m/Y H:i:s")." - Total de arquivos para processar: ".count($listaArquivos));    
}
CATCH (Exception $e)
{
  echo("\n\n RH: ".date("d/m/Y H:i:s")." - INTERRUPÇÃO DO PROCESSAMENTO - ERRO DE CONEXÃO COM BANCO DE DADOS.");
  echo "\n" . $e->getMessage() . "\n";
}

echo("\n\t".date("d/m/Y H:i:s")." - Total de arquivos para processar: ".count($listaArquivos));

$i=1;

while ( !$query->eof() )
{
	var_dump($i);
	$i++;
	
	$idArquivo      = $query->fields('idArquivo');
	$arquivo = $MIOLO->GetBusiness('common','arquivo');
	$arquivo->GetById($idArquivo);
	//var_dump("--------->>>>>> ","$arquivo->idArquivo");
	
		
	//$md5		 	= $query->fields('md5');	
	$nomeArquivo 	= $query->fields('nome');
	$nomeScript 	= $query->fields('scriptProcessamento');
	$caminhoScript  = $query->fields('caminhoScript');
	$nomeSimples	= strtolower(str_replace(".txt.gz","",strtolower($nomeArquivo)));
	$caminhoArquivo = $MIOLO->getConf('home.modules') . $query->fields('caminho');
	
    echo("\n\t".date("d/m/Y H:i:s")." - Processando arquivo: ".$nomeArquivo);
    
    TRY																	
    {	  
	//echo("\n\t"."php5 -f " . $MIOLO->getConf('home.modules').$caminhoScript.$nomeScript." $caminhoArquivo" . $nomeArquivo . " > {$caminhoArquivo}{$nomeSimples}.log");		
								
        exec("php -f " . $MIOLO->getConf('home.modules').$caminhoScript.$nomeScript." $idArquivo" . " > {$caminhoArquivo}{$nomeSimples}.log");
        exec("gzip -f9 {$caminhoArquivo}{$nomeSimples}.log");				               
	
		$arquivo->dataProcessamento = date("d/m/Y");
    $arquivo->nomeArqLog = "$nomeSimples.log.gz";
    $arquivo->caminhoArqLog = $caminhoArquivo."$nomeSimples.log.gz";
         
		$arquivo->beginTransaction();
		$arquivo->save();
		$arquivo->endTransaction();
		
    }
    CATCH (Exception $e)
    {    	
        echo $e->getMessage() . "\n";
    }
    
	$query->moveNext();
    
}
echo("\n".date("d/m/Y H:i:s")." - TERMINO DO PROCESSA ARQUIVO."); 

?>
