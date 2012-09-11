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

chdir('/home/ematos/public_html/miolo/classes');
//chdir('/usr/local/siga2/miolo/classes');

include_once '/home/ematos/public_html/miolo/classes/miolo.class';
include_once '/home/ematos/public_html/miolo/classes/support.inc';
//include_once '/usr/local/siga2/miolo/classes/miolo.class';
//include_once '/usr/local/siga2/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->setConf('logs.port','0');
$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

chdir('/home/ematos/public_html/miolo/modules/rh/offline');
//chdir('/usr/local/siga2/miolo/modules/rh/offline');

$db = $MIOLO->GetDatabase('ufjf');
$isr = $db->GetISR();
$sql = new sql('p.idpessoa,p.nome','cm_pessoa p, rh_funcionario f');
$sql->setJoin('cm_pessoa p','rh_funcionario f', 'p.idpessoa=f.idpessoa');
$query = $db->GetQuery($sql);

$i = 0;
while ((!$query->eof) && ($i < 1000))
{
    $id = $query->fields('idpessoa');
    $nome = $query->fields('nome');
    try {
       $isr->indexer('cm_pessoa','nome',$id, $nome, true);
    }
    catch (Exception $e) {
       print $e->getMessage() . "\n";
    }
    if (($i++ % 100) === 0) print ".";
    $query->MoveNext();
}
?>
