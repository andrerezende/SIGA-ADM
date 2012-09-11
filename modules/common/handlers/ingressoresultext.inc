<?
   $login = $MIOLO->getLogin();
   $login->idsetor = $login->idsector;
   $this->manager->session->SetValue('login', $login);
   $sid = $MIOLO->session->getId(); 
   $id = base64_encode($login->id); 
   $home = $MIOLO->getConf('home.url');
   $this->manager->getSession()->SetValue('goback', $home);
   $h = base64_encode($home); 
   $go = "http://www2.vestibular.ufjf.br/index.php?module=vestibular&action=fiscais:fiscais_result2008ext&item=$id&return=$h";
//   $go = "http://miolo.ufjf.br:8508/index.php?module=vestibular&action=fiscais:fiscais_result2008ext&item=$id&return=$h";
   $page->Redirect($go); 
?>