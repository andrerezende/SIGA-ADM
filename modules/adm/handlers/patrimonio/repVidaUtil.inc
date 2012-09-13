<?php
// 31/05/2011 Daniel Bonfim
if ($perms->CheckAccess('adm', A_ACCESS, true))
   // $theme->ClearContent();
//$navbar->AddOption('Relatório de Vida Útil', 'adm', 'main:patrimonio:repVidaUtil');

//$report = new MJasperReport('sigaept');
//$parameters['pURL'] = $MIOLO->GetConf('home.url');
//$parameters['pIdUsuario'] = $MIOLO->login->idkey;
$MIOLO->page->AddJsCode('window.open("http://' . $_SERVER['HTTP_HOST'] . '/relatorios2/view/itemPatrimonio/vw_repDepreciacaoPorContaContabil.php?idUoAlmoxerifado=' . '9' . '&uo=' . $uoalmoxarifado->sigla . '");');
//$report->Execute($module, 'repVidaUtilTodas', $parameters)

?>