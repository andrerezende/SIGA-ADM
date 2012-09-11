<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Cadastros como Bolsista', $module, $self);
    $grid = $ui->GetGrid($module,'gridBolsista');
    if ($theme->GetContent()  == '')
    {
      $theme->InsertContent($grid);
    }
?>

