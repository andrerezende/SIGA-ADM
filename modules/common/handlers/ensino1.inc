<?
   $login = $MIOLO->getLogin();
   $login->idsetor = $login->idsector;
   $this->manager->session->SetValue('login', $login);
   $sid = $MIOLO->session->getId(); 
   $go = 'http://arta.cpd.ufjf.br:8080/ensino.php?sid='.$sid;
//   $go = 'http://arta.cpd.ufjf.br:8080';
//   $go = 'http://pergamo.cpd.ufjf.br';
   $page->Redirect($go); 
?>
