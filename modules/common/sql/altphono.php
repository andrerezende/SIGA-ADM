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

for ($letter = 65; $letter <= 90; ++$letter)
{
   $char = chr($letter);
   $sql = new sql('w.idword, w.word, i.idfield, i.pk','isr_word w,isr_index i',"(w.word LIKE '$char%') and (w.idword=i.idword)");
   $query = $db->GetQuery($sql);
   echo $char;

   $i = 0;
   while (!$query->eof)
   {
      $idword = $query->fields('idword');
      $word = $query->fields('word');
      $idField = $query->fields('idfield');
      $pk = $query->fields('pk');

      $idWordFono = $isr->getIdWordFono($word);
      $sqlp = new sql('idField, idWord, PK','ISR_INDEXFONO');
      $sqlp->SetParameters($idField, $idWordFono, $pk);
      $db->Execute($sqlp->Insert());

      if (($i++ % 100) === 0) print ".";
      $query->MoveNext();
   } 
}
?>
