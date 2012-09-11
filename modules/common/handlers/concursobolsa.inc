<?
   $login = $MIOLO->getLogin();
   $login->idsetor = $login->idsector;
   $this->manager->session->SetValue('login', $login);
   $sid = $MIOLO->session->getId(); 
   $id = base64_encode($login->id); 
   $home = $MIOLO->getConf('home.url');
   $this->manager->getSession()->SetValue('goback', $home);
   $h = base64_encode($home); 
//  $go = "http://miolo.ufjf.br:8500/index.php?module=concurso&action=fiscais:inscbolsa&item=$id&return=$h";
//   $go = "http://siga1.ufjf.br/index.php?module=concurso&action=fiscais:inscbolsa&item=$id&return=$h";
//   $go = "http://miolo.ufjf.br:8500/index.php?module=concurso&action=fiscais:resultbolsa&item=$id&return=$h";
   $go = "http://siga1.ufjf.br/index.php?module=concurso&action=fiscais:resultbolsa&item=$id&return=$h";
   $page->Redirect($go); 
?>