<?php
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

ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");
//error_reporting(0);

//Nao esquecer de alterar os caminhos quando for "commitar".
$path = "/home/kimbow/public_html/miolo/";
//$path = "/usr/local/siga2/";

chdir("{$path}classes");
include_once "{$path}classes/miolo.class";
include_once "{$path}classes/support.inc";

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

chdir($MIOLO->getConf('home.modules').'/rh/offline');
$filename = $argv[1].$argv[2];
$fileNameTxt = str_replace(".gz","",$filename);
exec("gzip -d ".$filename);
$arrRegistros = file(trim($fileNameTxt));
exec("gzip -f9 ".$fileNameTxt);
echo(date("d/m/Y H:i:s")." - INICIO DO PROCESSAMENTO DE importExclusãoInstituidor.php."."\n");
$pensionista 		 = $MIOLO->GetBusiness('rh','pensionista');
$countTemp = 0;
$countPensionistas = 0;
$contador = 0;
for ($i = 1; $i < (count($arrRegistros)); $i++ ) //-7971 10%
{
	$registro = $arrRegistros[$i];
	$tipoRegistro = intval(substr($registro,24,1));
	$MATRICULA_PENSIONISTA = substr($registro,16,8);  //intval
	$MATRICULA_INSTITUIDOR = substr($registro,9,7);
	switch ($tipoRegistro)
	{
		case 1:
			$pensionista->GetById($MATRICULA_PENSIONISTA);
			$dataExclusao = substr($registro,98,2)."/".substr($registro,100,2)."/".substr($registro,102,4);
			if ( $dataExclusao != "00/00/0000" )
			{
				$pensionista->dataExclusaoInstituidor = $dataExclusao;echo"$dataExclusao";
			}
			$pensionista->Save();
			$contador++;
			echo ".";
		break;

		default:
			//echo "\nTipo de registro não previsto!\n";
		break;
	}
}
echo($contador);
echo("\n".date("d/m/Y H:i:s")." - $contador Registros Processados - Término do processamento do arquivo $fileNameTxt");
?>
