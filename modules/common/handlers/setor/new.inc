<?
    $perms->CheckAccess('setor',A_ACCESS,true);
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Setor', 'common', 'main:setor:new');
    $setor = $MIOLO->getBusiness('common','setor');
	$form = $ui->GetForm('common','frmSetorDados',$setor,'setor');
	$theme->InsertContent($form);
?>
