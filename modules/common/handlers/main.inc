<?php

$MIOLO->Trace('file:'.$_SERVER['SCRIPT_NAME']);

if ( ! $module )
{
    $module = 'common';
}

if (($sa = $context->ShiftAction()) != NULL )
{
    $a = $sa;			
}
elseif ($module != 'common')
{
    $a = 'main2';
}

if ($MIOLO->GetAuth()->isLogged())
{
    $ui = $MIOLO->GetUI();
    
    $theme->ClearContent();
    $navbar->setLabelHome('SIGA');

    $close = $MIOLO->GetActionURL('common','logout');

    $login = $MIOLO->GetLogin();
    $user = $this->manager->GetBusinessMAD('user');
    $user->GetByLogin($login->id);
    $plano = $MIOLO->getBusiness('common','planosaude',$login->id);

    $session = $MIOLO->session;

    $pessoa = $MIOLO->getBusiness('common','pessoa');
    $pessoa->getById($user->idPessoa);

/*    if ($plano->planoSaude == '')
    {
        $form = $ui->GetForm($module,'frmPlanoSaude', $login);
        $theme->SetContent($form);
    }
    elseif ($user->weakPassword()) */
    if ($user->weakPassword())
    {
        $content[] = new MLabel('Sua senha foi considerada fraca, sendo necessário alterá-la.','red', true);
        if ($MIOLO->GetConf('options.authmd5'))
        {            
			$content[] = $ui->GetForm($module,'frmPasswordMD5');
        }
        else
        {			
            $content[] = $ui->GetForm($module,'frmPassword');
        }
        $theme->SetContent($content);
    }
    elseif( $MIOLO->getPerms()->isMemberOf($login,'ALUNO') && !($MIOLO->getPerms()->isAdmin()) && ( $pessoa->datacartest == '' && !$session->isRegistered('naoConfirma') )  )
    {
        $form = $ui->getForm($module,'frmCarteiraEstudante',$login->id);
        $theme->setContent($form);
    }
    else
    {
        // 26-10-2011 - Daniel Bonfim		
        $cmPanel = $ui->GetForm("common",'frmMain2');
        /*
        $cmPanel = new MActionPanel('pnlMain','SIGA - Menu Principal','', $close, $ui->GetImage($module,'modules_list1.png'));
    //    $cmPanel->setControlSize('600px','15px');
        $cmPanel->AddUserAction('adm',A_ACCESS,'Administração', $ui->GetImageTheme('','icons/administracao.png'), 'adm', 'main');
        $cmPanel->AddUserAction('prot',A_ACCESS, 'Protocolo', $ui->GetImageTheme('','icons/protocolo.png'), 'protocolo', 'main:processos:find');
		$cmPanel->AddUserAction('PROT_CONF',A_EXECUTE,'Configuração',$ui->GetImageTheme('','icons/configuracao.png'), 'protocolo','main:configuracao');
        $cmPanel->AddUserAction('rh',A_ACCESS, 'Recursos Humanos', $ui->GetImageTheme('','icons/pessoas2.png'), 'rh', 'main');
        if ($MIOLO->getPerms()->isAdmin())
        {
            $cmPanel->AddAction( 'MAD', $ui->GetImageTheme('','icons/MAD.png'), $module, 'main:mad');
        }
        $cmPanel->AddAction( 'Alterar sua senha', $ui->GetImageTheme('','icons/alterar_sua_senha.png'), $module, 'main:password');
        $cmPanel->AddUserAction('trocasenha',A_ACCESS,'Troca Senha de Usuário',$ui->GetImageTheme('','icons/alterar_senha_de_usuario.png'),'common','main:trocasenha');
        if ( ! $MIOLO->getPerms()->isMemberOf('','SIGA_FUNCIONARIO') )
        {
            $cmPanel->AddAction( 'Dados Pessoais', $ui->GetImageTheme('','icons/dados_pessoais.png'), $module, 'dadospessoais');
        }
        $cmPanel->AddAction( 'Sair', $ui->GetImageTheme('','icons/sair.png'), $module, 'logout');
    */
        $handled = $MIOLO->InvokeHandler($module,$a);
        if (! $handled)
        {			
            $theme->InsertContent($cmPanel);
        }

        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
    }
}
else
{
    if ($a == 'main2' || $a == NULL)
    {
		$ui = $MIOLO->GetUI();
        $logo_siga = $ui->getImageTheme($MIOLO->getTheme()->id, 'logo_siga.jpg');
        $image = new MImage('', 'Home', $logo_siga);
        $a = new MDiv('',$image);
        $form = $ui->GetForm('common', $MIOLO->GetConf('options.authmd5') ? 'frmLoginMD5' : 'frmLogin');
        $form->SetLabelWidth('25');

		$d = new MDiv('',$form);
        //$d->width = '450px';
        $c = new MHcontainer('');
        $c->addControl($a);
        $c->addControl($d);
        $content[] = $c;
        $theme->SetContent($content);
        $page->setAction($MIOLO->getConf('home.url') . '/' . $MIOLO->getContext()->composeURL('','common','main2'));
        
    }
    else
    {
		$handled = $MIOLO->InvokeHandler($module,$a);
    }
}
?>
