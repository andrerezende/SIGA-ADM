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

/*
chdir('/home/danilo/public_html/miolo/modules/adm/offline');
include_once 'csv2array.inc';

$csvfile = 'material.csv';
$cs = new csv2array();
$array = $cs->getArray($csvfile);
*/

$material = $MIOLO->GetBusiness('adm','material');
$subElemento = $MIOLO->GetBusiness('adm','subelemento');

foreach($material->ListAll()->result as $row)
{
    if ($idSubElementoAnterior != $row[6])    
    {
        $subElemento->GetById($row[5],$row[6]);
        echo "\n"."SUBELEMENTO: ".$row[5]." - ".$row[6]." - ".$subElemento->descricao."\n";
    }
    
    echo $row[7].";";
    echo $row[1].";";
    echo $row[2].";";
    echo $row[3].";";
    echo $row[4].";";
//    echo $row[5].";";
//    echo $row[6].";";
    echo "\n";

    $idSubElementoAnterior = $row[6];
    $i++;
}
echo "Total: ".$i." registros. \n";
?>
