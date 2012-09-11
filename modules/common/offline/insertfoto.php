<?
ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

chdir('/home/ematos/public_html/miolo/classes');
include_once '/home/ematos/public_html/miolo/classes/miolo.class';
include_once '/home/ematos/public_html/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$MIOLO->setConf('logs.port','0');

$db = $MIOLO->GetDatabase('sigaept');
$t = $db->getTransaction();
$t->begin();
$s1 = new MSQL('idfoto,idpessoa,foto','cm_foto');
$db->execute($s1->Insert(array('1','200216',':EMPTY_BLOB()')));
var_dump($s1->command);

$s2 = new MSQL('idfoto,idpessoa,foto','cm_foto','idfoto=1');
$s2->setForUpdate(true);
$query = $db->getQuery($s2);
var_dump($s2->command);

$mylob = $query->fields("foto");
var_dump(get_class($mylob));

chdir('/home/ematos/public_html/miolo/modules/common/offline');
$foto = file_get_contents('foto.jpg');

$mylob->truncate();

$mylob->save($foto);

$t->commit();


?>
