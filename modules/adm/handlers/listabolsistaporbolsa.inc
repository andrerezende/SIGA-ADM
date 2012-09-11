<? 
    $pgGeral = $_REQUEST['pgGeral']; 
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('SisPag', $module, 'main:sispag');
    $navbar->AddOption('Pag. Bolsa', $module, 'main:pagbolsa');
    if ( $pgGeral == 'sim' )
    {
		$navbar->AddOption('Novo Pagamento em Bloco', $module, $self);	
	}
	else	
	{
		$navbar->AddOption('Novo Pagamento', $module, $self);	
	}
	$listing = $ui->GetGrid($module,'gridBolsistaPorBolsa');
    if ($theme->GetContent()  == '')
    {
        $theme->InsertContent($listing);
    } 
?>

