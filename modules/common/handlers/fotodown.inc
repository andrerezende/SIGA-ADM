<?
$db = $MIOLO->getDatabase('sigaept');
$s1 = new MSQL('idfoto,idpessoa,mimetype,foto','cm_foto',"idfoto=$item");
$q = $db->getQuery($s1);
$r = $q->result;

$page = $MIOLO->getPage();
$page->generateMethod = 'generateFile';
$page->setFile('foto',$r[0][3],$r[0][2],strlen($r[0][3]));
?>
