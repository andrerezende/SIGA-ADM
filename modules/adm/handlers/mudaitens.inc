<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Item', $module, $self);
    $form = $ui->GetForm($module,'frmMudaItens');
	if ($theme->GetContent()  == '')
    {
      $theme->InsertContent($form);
    }

?>


