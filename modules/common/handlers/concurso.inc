<?
   $login = $MIOLO->getLogin();
   $login->idsetor = $login->idsector;
   $this->manager->session->SetValue('login', $login);
   $sid = $MIOLO->session->getId(); 
   $id = base64_encode($login->id); 
   $go = "http://miolo.ufjf.br:8500/index.php?module=concurso&action=fiscais:fiscaisresultserv&item=$id";
   $page->Redirect($go); 
?>
