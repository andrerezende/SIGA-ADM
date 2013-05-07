<?php

$theme->ClearContent();
	$ui = $MIOLO->GetUI();
           $objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$item); 
           
           $navbar->AddOption('Requisição', 'adm', 'main:requisicaoveiculo:findveiculo');
           //$navbar->AddOption('Motorista Login', 'adm', 'main:requisicaoveiculo:findveiculo');
	  $form = $ui->GetForm('adm','frmConformidadeMotorista',$objRequisicao,'requisicoes');
	  $theme->InsertContent($form);
       
?>
