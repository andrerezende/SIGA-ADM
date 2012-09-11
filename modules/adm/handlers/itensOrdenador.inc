<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Item', $module, $self);
    $form = $ui->GetForm($module,'frmItensOrdenador');
    if ($theme->GetContent()  == '')
    {
      $theme->InsertContent($form);
    }

?>


