<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Bolsas pertimidas para o Usuario', $module, $self);
    $listing = $ui->GetGrid($module,'gridAcessoBolsa');
    if ($theme->GetContent()  == '')
    {
      $theme->InsertContent($listing);
    }
?>

