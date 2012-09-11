<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    //$obj = $MIOLO->GetBusiness('common','pais', $item);
	$objpais = $MIOLO->GetBusiness('common','pais');
	$obj =	$objpais->GetById($item);
        $obj->idPais = $item;

    $navbar->AddOption(ucwords(strtolower($obj->pais)), 'common', 'main:pais:find');
    $form = $MIOLO->GetUI()->GetForm($module,'frmPais', $obj,'pais');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
