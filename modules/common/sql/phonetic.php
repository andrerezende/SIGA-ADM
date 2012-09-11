<?
/***********************************************************/
/* Arquivo Principal 
/***********************************************************/

include_once 'e:/miolo/miolo2/classes/startup.inc';
include_once 'e:/miolo/miolo2/classes/miolo.class';
include_once 'e:/miolo/miolo2/classes/utils/phonetic.class';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new ConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->Init();

$db = $MIOLO->GetDatabase('sigaept');
$isr = $db->GetISR();

$sql = new sql('idpessoa,nome','cm_pessoa');

$query = $db->GetQuery($sql);

$i = 0;
while (!$query->eof)
{
    $id = $query->fields('idpessoa');
    $nome = $query->fields('nome');
    try {
       $isr->Indexer('cm_pessoa','nome',$id, $nome, true);
    }
    catch (Exception $e) {
       print $e->getMessage() . "\n";
    }
    if (($i++ % 100) === 0) print ".";
    $query->MoveNext();
}
?>
