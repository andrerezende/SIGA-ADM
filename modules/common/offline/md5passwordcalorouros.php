<?
ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

$path = "/home/ematos/public_html/miolo/";

chdir("{$path}classes");
include_once "{$path}classes/miolo.class";
include_once "{$path}classes/support.inc";

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$MIOLO->setConf('logs.port','0');

$db = $MIOLO->GetDatabase('sigaept');
$s1 = new MSQL('idusuario,password','cm_usuario',"password like 'DATA%'");
$q1 = $db->getQuery($s1);

foreach ( $q1->result as $rs )
{
	$usuario = $MIOLO->getBusiness('common','usuario',$rs[0]);
    $pass = substr($rs[1],4,6);
    echo $pass . "\n";
	$usuario->UpdatePasswordMD5(md5($pass));
}

?>