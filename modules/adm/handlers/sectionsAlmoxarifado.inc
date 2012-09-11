<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Operador de Almoxarifado',$module,$self);
$panel2 = new ActionPanel('pnlAlmox','Relatórios Disponíveis');
$panel2->SetIconType('small');
$panel2->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Movimentos',$ui->GetImage('tutorial3','pdf.png'),$module,'main:relatMovimentosPorData');
$panel2->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Sub-elementos',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repSubElemento');
$panel2->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Ordem de Entrega',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repOrdemEntrega');
$panel2->AddUserAction('adm_opalmoxarifado',A_ACCESS,'OE por Faixa',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repOrdemEntregaPorFaixa');
$panel2->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Tomada de Conta',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repTomadaDeConta');
$panel2->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Estoque',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repEstoque');
//$panel2->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Requisições',$ui->GetImage('tutorial3','pdf.png'),$module,'main:repRequisicao');
$theme->InsertContent($panel2);

$panel = new ActionPanel('pnlAlmox','Operações');
$panel->SetIconType('small');
$panel->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Requisições',$ui->GetImage($module,'cadbolsa.png'),$module,'main:almoxarifado');
$panel->AddUserAction('adm_opalmoxarifadolocal',A_ACCESS,'Material',$ui->GetImage($module,'gnome-util.png'),$module,'main:entradaMaterial');
$panel->AddUserAction('adm_opalmoxarifadocentral',A_ACCESS,'Material (Central)',$ui->GetImage($module,'gnome-util.png'),$module,'main:entradaMaterialCentral');
$panel->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Consolidar Requisições',$ui->GetImage($module,'file-manager.png'),$module,'main:consolidarRequisicoes');
$panel->AddUserAction('adm_opalmoxarifado',A_ACCESS,'Estoque Inicial ',$ui->GetImage($module,'stock_network-printer.png'),$module,'main:EstoqueInicial');
$theme->InsertContent($panel);



?>
