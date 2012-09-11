<?php

if ($MIOLO->GetAuth()->isLogged())
{
    $ui = $MIOLO->GetUI();
    
    $theme->ClearContent();
    $navbar->AddOption('MAD', $module, 'mad');

    $close = $MIOLO->GetActionURL('common','main');
    $cmPanel = new MActionPanel('pnlCommon','Common - Administração','', $close, $ui->GetImageTheme('','tools1.png'));
    if ($MIOLO->getPerms()->isAdmin())
    {
		$cmPanel->AddAction( 'Sistema', $ui->GetImageTheme('','icons/sistema.png'), $module, 'main:mad:sistema:find');
		$cmPanel->AddAction( 'Instituição', $ui->GetImageTheme('','icons/instituicao.png'), $module, 'main:mad:instituicao:find');
        $cmPanel->AddAction( 'Transações', $ui->GetImageTheme('','icons/transacoes.png'), $module, 'main:mad:transacao:find');
        $cmPanel->AddAction( 'Usuários', $ui->GetImageTheme('','icons/usuarios.png'), $module, 'main:mad:users');
        $cmPanel->AddAction( 'Grupos', $ui->GetImageTheme('','icons/grupos.png'), $module, 'main:mad:grupo:find');
        $cmPanel->AddAction( 'Bancos Agências', $ui->GetImageTheme('','icons/bancos_agencias.png'), $module, 'main:mad:banco:find');
        $cmPanel->AddAction( 'Pessoas', $ui->GetImageTheme('','icons/pessoas.png'), $module, 'main:mad:pessoa:find');
        $cmPanel->AddAction( 'Setores', $ui->GetImageTheme('','icons/setores.png'), $module, 'main:mad:setor:find');
        $cmPanel->AddAction( 'País', $ui->GetImageTheme('','icons/pais.png'), $module, 'main:mad:pais:find');
		$cmPanel->AddAction( 'Municipio', $ui->GetImageTheme('','icons/municipio.png'), $module, 'main:mad:municipio:find');
	 	$cmPanel->AddAction( 'Tabela Geral', $ui->GetImageTheme('','icons/tabela_geral.png'), $module, 'main:mad:tabelageral:find');
        $cmPanel->AddAction( 'Organograma', $ui->GetImageTheme('','icons/organograma.png'), $module, 'main:mad:organograma:find');
        $cmPanel->AddAction( 'Senha', $ui->GetImageTheme('','icons/senha.png'), $module, 'main:mad:password');
    }

    $a = $context->shiftAction();
    $handled = $MIOLO->InvokeHandler($module,$a);
    if (! $handled)
    {
        $theme->InsertContent($cmPanel);
    }
}
else
{
    $ui = $MIOLO->GetUI();
    $content =  $ui->GetForm($module, $MIOLO->GetConf('options.authmd5') ? 'frmLoginMD5' : 'frmLogin');
    $theme->SetContent($content);
}
// 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
?>
