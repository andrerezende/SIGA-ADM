<?
ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

chdir('/usr/local/siga2/classes');
include_once '/usr/local/siga2/classes/miolo.class';
include_once '/usr/local/siga2/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$MIOLO->setConf('logs.port','0');

$db = $MIOLO->GetDatabase('sigaept');
$s1 = new MSQL('idusuario,password','cm_usuario',"passmd5 is null and login like '200654%'");
$q1 = $db->getQuery($s1);

foreach ( $q1->result as $rs )
{
	$usuario = $MIOLO->getBusiness('common','usuario',$rs[0]);
	$usuario->UpdatePasswordMD5(md5($rs[1]));
}

?>
