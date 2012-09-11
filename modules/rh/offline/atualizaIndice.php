<?
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

chdir('/home/thiago/public_html/miolo/classes');
include_once '/home/thiago/public_html/miolo/classes/miolo.class';
include_once '/home/thiago/public_html/miolo/classes/support.inc';

//chdir('/usr/local/siga2/miolo/classes');
//include_once '/usr/local/siga2/miolo/classes/miolo.class';
//include_once '/usr/local/siga2/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$MIOLO->setConf('logs.port','0');

chdir('/home/thiago/public_html/miolo/modules/rh/offline');
//chdir('/usr/local/siga2/miolo/modules/rh/offline');

include_once 'csv2array.inc';

//$o = $MIOLO->GetBusiness('common','indicemensal');

$csvfile = 'marco2002.csv';
$cs = new csv2array();
$array = $cs->getArray($csvfile);
//$o->beginTransaction();
foreach($array as $count=>$row)
{
    $data = $row[0];
    $valor = $row[1];

    list($dia,$mes,$ano) = explode('/',$data);
  // $o->getByMesAnoSigla($mes,$ano,'BASE');
   //$o->setValor(str_replace(',','.',$valor));

    echo "INSERT INTO CM_INDICEMENSAL VALUES ( SEQ_CM_INDICEMENSAL.NEXTVAL, $ano,$mes,$valor,'BASE');\n";
   /*
   try
   {
       $o->save(); 
   }
   catch (Exception $e)
   {
       echo $e->getMessage() . '\n';
   }
   $o->setPersistent(false);
   */
}
//$o->endTransaction();
?>
