<?php
//$perms->CheckAccess('ADM', A_ACCESS, true);
//
//$theme->ClearContent();
//$ui = $MIOLO->GetUI();
//
//$objPedido = $MIOLO->GetBusiness('adm', 'notafiscal');
//
//$form = $ui->GetForm('adm', 'frmNotaFiscal', NULL, 'notafiscal');
//
//$theme->InsertContent($form);
//
//
//$a = $context ? $context->ShiftAction() : 'main';
//$handled = $MIOLO->InvokeHandler($module, $a);


if ($perms->CheckAccess('adm', A_ACCESS, true)) {
	$theme->ClearContent();
}

$ui = $MIOLO->GetUI();
$objNota = $MIOLO->GetBusiness('adm', 'notafiscal', $item);
//var_dump($objNota);exit;
$numero=$objNota->notaFiscal;
$navbar->AddOption("Nota Fiscal: $numero",$module,'main:notafiscal');
$form = $ui->GetForm($module,'frmNotaFiscal', $item, 'patrimonio');


$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);