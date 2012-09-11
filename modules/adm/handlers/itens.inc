<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Item', $module, $self);
    $form = $ui->GetForm($module,'frmItens');
    if ($theme->GetContent()  == '')
    {
      $theme->InsertContent($form);
    }

?>


