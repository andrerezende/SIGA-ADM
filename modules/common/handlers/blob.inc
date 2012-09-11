<?
$db = $MIOLO->getDatabase('sigaept');
/*
$sql = new MSQL('idfoto,idpessoa,foto','cm_foto');
$sql->bind(array(':idfoto',':idpessoa','EMPTY_BLOB()'));
$sql->insert();
$db->parse($sql);
$db->bind($sql,array(':idfoto'=>'1',':idpessoa'=>'1'));
$db->execute($sql);
*/

/*
$t = $db->getTransaction();
$t->begin();
$s1 = new MSQL('idfoto,idpessoa,foto','cm_foto');
$s1->setForUpdate(true);
$q = $db->getQuery($s1);
$r = $q->result;
echo '#';
var_dump($r);
$r[0][2]->save('');
echo '#';
$t->commit();
*/

$t = $db->getTransaction();
$t->begin();
$lob = oci_new_descriptor($db->conn->id, OCI_D_LOB);
$sql = new MSQL('foto','cm_foto','idfoto=1 returning foto into :foto');
$sql->update(':EMPTY_BLOB()');
$db->parse($sql);
$db->bind($sql,array(':foto'=>array($lob,-1,OCI_B_BLOB)));
$db->execute($sql);
$lob->savefile('images/principal.jpg');
$t->commit();

$t = $db->getTransaction();
$t->begin();
$s1 = new MSQL('idfoto,idpessoa,foto','cm_foto');
$s1->setForUpdate(true);
$q = $db->getQuery($s1);
$r = $q->result;
$t->commit();

$page = $MIOLO->getPage();
$page->generateMethod = 'generateFile';
$page->setFile('foto',$r[0][2],'image/jpeg',strlen($r[0][2]));

/*
$query = $db->getQuery($sql);
var_dump($query->getRowcount());
*/
?>
