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
?>

<?php
/**
* @package SIGA
* @subpackage Biblioteca
* @author SETEC/MEC
*/

/**
* Script material
* Utilizado para listar obras, etiquetas com sua sequencia de ocorrencias desatualizada em bt_material
* @author Ronaldo Gazolla
* @package biblioteca
*/

//Inicialização do Miolo necessária para rodar script offline
ini_set("memory_limit","20M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");
//chdir('/home/rgazolla/miolo/classes');
//include_once '/home/rgazolla/miolo/classes/miolo.class';
//include_once '/home/rgazolla/miolo/classes/support.inc';
chdir('/usr/local/siga2/classes');
include_once '/usr/local/siga2/classes/miolo.class';
include_once '/usr/local/siga2/classes/support.inc';

//Nome do modulo
$module = 'biblioteca';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->conf->LoadConf($module);

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

//Script 

// Lista todas as obras
$obj = $MIOLO->GetBusiness($module,'usuario');
$sql = new sql('distinct(idobra)','bt_material','');
$query = $obj->Query($sql);
$obras = $query->result;

$Arq = fopen("/usr/local/siga2/modules/biblioteca/offline/material.txt","w+");
//$Arq = fopen("/home/rgazolla/miolo/modules/biblioteca/offline/material.txt","w+");

foreach ($obras as $obra)
{
	// Lista todas as etiquetas da obra
	$sql = new sql('distinct(idetiqueta)','bt_material',"idobra = $obra[0]");
	$query = $obj->Query($sql);
	$etiquetas = $query->result;

	foreach($etiquetas as $etiqueta)
	{
		$sql1 = new sql('count(distinct(ocorrencia))', 'bt_material', "(idobra = $obra[0]) and (idetiqueta = $etiqueta[0])");
		$query1 = $obj->Query($sql1);
		$sql2 = new sql('max(ocorrencia)', 'bt_material', "(idobra = $obra[0]) and (idetiqueta = $etiqueta[0])");
		$query2 = $obj->Query($sql2);

		if($query1->result[0][0] <> $query2->result[0][0])
		{
			fwrite($Arq, "Obra: " . $obra[0] . " Etiqueta: " . $etiqueta[0] . " Total: " . $query1->result[0][0] . " Max: ". $query2->result[0][0] . "\n");
		}
	}
}
fclose($Arq);
?>
