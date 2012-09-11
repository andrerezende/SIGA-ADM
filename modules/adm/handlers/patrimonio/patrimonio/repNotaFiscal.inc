<?php
// 31/05/2011 Daniel Bonfim
global $MIOLO, $module, $item;

if($perms->CheckAccess('adm',A_ACCESS,true))
$theme->ClearContent();
$navbar->AddOption('Relatório de Nota Fiscal', 'adm', 'main:patrimonio:repNotaFiscal');


$form = $MIOLO->GetUI()->GetForm($module,'frmRepNotaFiscalTodas', '', 'patrimonio');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);

/*
$report = new MJasperReport('sigaept');
$parameters['pURL'] = $MIOLO->GetConf('home.url');
$parameters['pIdUsuario'] = $MIOLO->login->idkey;
$report->Execute($module, 'repNotaFiscalTodas', $parameters);
*/
?>
