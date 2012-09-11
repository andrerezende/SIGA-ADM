<?
  //$perms->CheckAccess('',A_ACCESS,true);

    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Controle de Veículos',$module,'main:manutencaoveiculo');
    
    $close = $MIOLO->GetActionURL($module,'main');

    $panel = new ActionPanel('pnlManutencaoVeiculo','Controle de Veículos','',$close);
    $panel->AddUserAction('',A_EXECUTE,'Manutenção de Veículos',$ui->GetImage('controle','kcontrol.png'),$module,'main:notafiscal:find');
    $panel->AddUserAction('',A_EXECUTE,'Empresa',$ui->GetImage('controle','empresa.png'),$module,'main:empresa:find');
	$panel->AddUserAction('',A_EXECUTE,'Tipo de Manutenção',$ui->GetImage('controle','tools.gif'),$module,'main:tipomanutencao:find');
    $panel->AddUserAction('',A_EXECUTE,'Veículo',$ui->GetImage('controle','veiculo.png'), 'adm','main:veiculo:find');
	$panel->AddUserAction('',A_EXECUTE,'Previsão de Revisão',$ui->GetImage('controle','veiculos_editar.png'), $module,'main:prevrevisao:find');
	$panel->AddUserAction('',A_EXECUTE,'Relatórios',$ui->GetImage('controle','relatorio.png'),$module,'main:relatoriosveiculos');
	$theme->AppendContent($panel);
?>
