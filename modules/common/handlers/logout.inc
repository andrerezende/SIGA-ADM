<?php
    $MIOLO->GetAuth()->Logout();
    $page->Redirect($MIOLO->GetConf('home.url'));
?>
