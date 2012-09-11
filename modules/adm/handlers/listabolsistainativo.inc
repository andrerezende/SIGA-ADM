<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Cadastros Inativos do Bolsista', $module, $self);
    $grid = $ui->GetGrid($module,'gridBolsistaInativo');
    if ($theme->GetContent()  == '')
    {
      $theme->InsertContent($grid);
    }
?>

