<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $patrimonio = $MIOLO->GetUI();
    $objPatrimonio = $MIOLO->GetBusiness('adm','itempatrimonio', $item);

	if(strlen($objPatrimonio->descricao) < 40)
	{
		$navbar->AddOption($objPatrimonio->descricao, 'adm', 'main:itempatrimonio:main');
	}
	else
	{
		$navbar->AddOption(substr($objPatrimonio->descricao,0,40) . '...', 'adm', 'main:itempatrimonio:main');
	}
	$form = $MIOLO->GetUI()->GetForm($module,'frmPatrimonio', $objPatrimonio, 'patrimonio');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
