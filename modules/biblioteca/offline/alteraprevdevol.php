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
* Script alteraprevdevol
* Utilizado para alterar a previsão de devolução durante o período de férias, greve, etc.
* @author Cristina Perantoni
* @package biblioteca
*/

//Inicialização do Miolo necessária para rodar script offline
ini_set("memory_limit","20M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");
//chdir('/home/cristina/public_html/miolo/classes');
//include_once '/home/cristina/public_html/miolo/classes/miolo.class';
//include_once '/home/cristina/public_html/miolo/classes/support.inc';
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

$obj = $MIOLO->GetBusiness($module,'emprestimo');

$Arq = fopen("/usr/local/siga2/modules/biblioteca/offline/ResultAlteraPrevDevol.txt","w+");
//$Arq = fopen("/home/cristina/public_html/miolo/modules/biblioteca/offline/ResultAlteraPrevDevol.txt","w+");

try
{
	$obj->alteraPrevDevol();
	fwrite($Arq, "Datas alteradas com sucesso em " . date("d/m/Y H:i:s"));
}
catch (Exception $e)
{
	fwrite($Arq, $e->getMessage());
}

fclose($Arq);
?>
