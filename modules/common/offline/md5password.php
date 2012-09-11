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
$s1 = new MSQL('idusuario,password','cm_usuario');
$q1 = $db->getQuery($s1);

$i = 0;
$s2 = new MSQL('passMD5','cm_usuario','idusuario=?');
$s2->Bind(array(':passMd5',':idusuario'));
$s2->Update();
$db->parse($s2);

/*
$s3 = new MSQL('passMD5','cm_usuario','idusuario=?');
echo $s3->select(array('::idusuario'));
echo $db->parse($s3);
for($i=1000;$i< 1500; $i++)
{
$s3->Bind(array(':idusuario'=>$i));
//$db->bind($s2);
$q = $db->getQuery($s3);
if ($q->fields("passmd5") != '') echo  "\n" . $q->fields("passmd5");
}
*/

while((! $q1->eof))
{
    $idusuario = $q1->fields("idusuario");
    $md5 = md5($q1->fields("password"));
    $db->bind($s2,array(':passMd5'=>$md5,':idusuario'=>$idusuario));
    $db->execute($s2);
    if (($i++ % 100) == 0) echo $i . ' ';
    $q1->moveNext();
}

$q1->Close();
?>
