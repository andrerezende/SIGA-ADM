<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Bolsas',$module,'main:sispag');
	$navbar->AddOption('Pagamento Bolsa', $module, 'main:pagbolsa');
    $navbar->AddOption('Pagamentos por mês', $module, $self);
    $listing = $ui->GetGrid($module,'gridPagBolsa');
    if ($theme->GetContent()  == '')
    {
      $theme->InsertContent($listing);
    }
?>

