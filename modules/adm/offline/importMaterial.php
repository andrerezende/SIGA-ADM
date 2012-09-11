<?
ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

chdir('/home/danilo/public_html/miolo/classes');
include_once '/home/danilo/public_html/miolo/classes/miolo.class';
include_once '/home/danilo/public_html/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$MIOLO->setConf('logs.port','0');

chdir('/home/danilo/public_html/miolo/modules/adm/offline');
include_once 'csv2array.inc';

$o = $MIOLO->GetBusiness('adm','material');

$csvfile = 'materiais_25_01_07.csv';
$cs = new csv2array();
$array = $cs->getArray($csvfile);

foreach($array as $count=>$row)
{
//	var_dump($row[6]);

   $o->setPersistent(false);
   $o->codmaterial = $row[0];
   $o->descricao = $row[1];
   $o->unidade = $row[2];
   $o->idelemento = $row[3];
   $o->idsubelemento = $row[4];
   $o->permcons = $row[5];
   $o->estocavel = $row[6];
	
   try
   {
       $o->save(); 
   }
   catch (Exception $e)
   {
       echo "ERRO: ".$e->getMessage() . '\n';
   }
}
?>
