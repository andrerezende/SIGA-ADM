<?

ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");
PutEnv("NLS_LANG=portuguese_brazil.we8iso8859p1");


chdir('/home/danilo/public_html/miolo/classes');
include_once '/home/danilo/public_html/miolo/classes/miolo.class';
include_once '/home/danilo/public_html/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$MIOLO->setConf('logs.port','0');

$module = 'adm';

$db = $MIOLO->getDatabase('sigaept');
$sql = new Msql(
    "idlancamentoint,tipolancamento,to_char(data,'DD/MM/YYYY'),idrequisicao,valor",
    "ad_lancamentoint",
    "data > to_date('01/01/2008','DD/MM/YYYY')"
    );
    
$query = $db->getQuery($sql);

$i = 0;
foreach ( $query->result as $rs )
{
    $idlancamentoint = $rs[0];
    $tipolancamento = $rs[1];
    $data = $rs[2];
    $idrequisicao = $rs[3];
    $valor = $rs[4];

    $sql = new Msql(
            "idlancamentoint",
            "ad_lancamentoint",
            "tipolancamento = '$tipolancamento' and data = to_date('$data','DD/MM/YYYY') and idrequisicao = '$idrequisicao' and valor = '$valor' and idlancamentoint <> '$idlancamentoint'"
        );

    $query2 = $db->getQuery($sql);

    if ( ! $query2->eof() )
    {
        echo "Registros duplicados para o id $idlancamentoint :\n";
        foreach ( $query2->result as $rs2 )
        {
            echo $rs2[0]."\n";
        }
    }
}
?>
