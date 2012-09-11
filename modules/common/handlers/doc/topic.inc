<?

$topics = array('db'   => 'miolo/database.class',
                'ui'   => 'miolo/ui.class',
                'form' => 'miolo/ui/form.class');

$t = $topics[$item];

if ( ! $t )
{
    return false;
}

$url = $MIOLO->GetActionURL('common','main:doc:index:file',$t);

header('Location: '. $url);

return true;

?>
