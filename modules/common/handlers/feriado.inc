<?

$home = 'main:admin';
$navbar->AddOption('feriado','common', $home . ':feriado');

$feriado = $MIOLO->GetBusiness('common','feriado');
$content[] = new MLabel('26/05/2005');
if ($feriado->feriado('26/05/2005'))
{
    $content[] = new MLabel('é feriado');
    $content[] = new MLabel(' - descrição: ' . $feriado->descricao);
}
else
{
    $content[] = new MLabel('não é feriado');
}
$content[] = new MSpacer();
$content[] = new MLabel('26/06/2005');
if ($feriado->feriado('26/06/2005'))
{
    $content[] = new MLabel('é feriado');
    $content[] = new MLabel(' - descrição: ' . $feriado->descricao);
}
else
{
    $content[] = new MLabel('não é feriado');
}
$theme->InsertContent($content);
?>
