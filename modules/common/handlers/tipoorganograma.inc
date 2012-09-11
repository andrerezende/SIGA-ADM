<?

$perms->CheckAccess('admin',A_ACCESS,true);
$home = 'main:admin';
$navbar->AddOption('Tipo Organograma','common', $home . ':tipoorganograma');
$ui = $MIOLO->GetUI();

$form = $ui->GetForm('common','frmTipoOrganograma');
if ($theme->GetContent()  == '')
{
    $theme->InsertContent($form);
}
?>
