<?php

    $auth->Logout('S');
    $theme->SetContent($MIOLO->Error('A sessão está sendo encerrada pois o tempo de inatividade excedeu o limite.', $MIOLO->GetActionURL('common','main'),'Timeout!'));
?>
