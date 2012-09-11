<?
   $login = $MIOLO->getLogin();
   $login->idsetor = $login->idsector;
   $this->manager->session->SetValue('login', $login);
   $sid = $MIOLO->session->getId(); 
   $id = base64_encode($login->id); 
   $home = $MIOLO->getConf('home.url');
   $this->manager->getSession()->SetValue('goback', $home);
//   $go = "http://www3.vestibular.ufjf.br/index.php?module=vestibular&action=fiscais:fiscaisresultserv2&item=$id";
   $go = "http://miolo.ufjf.br:8500/index.php?module=vestibular&action=fiscais:fiscaisresultserv2&item=$id";
   $page->Redirect($go); 
?>
