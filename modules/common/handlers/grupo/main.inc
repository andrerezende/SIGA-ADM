<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    $objGrupo = $MIOLO->GetBusiness('common','grupo');

    $objGrupo->getById($item);
    
    $navbar->AddOption(ucwords(strtolower($objGrupo->grupo)),'common','main:mad:grupo:main',$item);
    
    $form = $MIOLO->GetUI()->GetForm($module,'frmGrupo',$objGrupo,'grupo');
    
    $theme->InsertContent($form);
?>
