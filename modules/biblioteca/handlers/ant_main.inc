<?php
/* Copyright 2006, 2007, 2008, 2009, 2010 do SETEC/MEC
 *
 * Este arquivo é parte do programa SigaEPT
 *
 * O SigaEPT é um software livre;  você pode redistribuí-lo e/ou modificá-lo dentro dos
 * termos da Licença Pública Geral GNU como publicada pela fundação do software livre (FSF);
 * na versão 2 da Licença.
 *
 * Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA GARANTIA; sem
 * uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja Licença
 * Pública Geral GNU/GPL em português para maiores detalhes.
 *
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título “LICENCA.txt”,
 * junto com este programa, se não, acesse o portal do Software Público Brasileiro no endereço
 * www.softwarepublico.gov.br ou escreva para Fundação do Software Livre (FSF) Inc.,51 Franklin
 * St, Fifth Floor, Boston, MA 02110-1301, USA
 */
?>
<?

	$theme->ClearContent();


// obter acesso as classes de Interface de Usuario
    $ui = $MIOLO->GetUI();
	

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual ('tutorial3')
// a ultima opção da barra de navegação não é clicável, pois aponta para
// a página atualmente aberta. Nas páginas seguintes será clicável.
	$navbar->setLabelHome('SIGA');
    $navbar->AddOption('Biblioteca', $module, 'main');
    include_once($MIOLO->GetConf('home.modules').'/main_menu.inc');
	
    
/* definir um conteúdo
    $content = "<h1>Siga Biblioteca</h1>";

 colocando conteúdo página
    $theme->SetContent($content);
*/

//	$menuprincipal = $theme->GetMainMenu();
//  $session->setValue("num_mainmenu",0);
//	$menuprincipal->SetTitle("Menu Principal");


/*
// cria o menu
	$bibMenu = $theme->GetMainMenu();
	$session->setValue("num_mainmenu",0); // manter o menu Biblioteca sempre na primeira posição

// definindo título de menu. O objeto $admMenu foi criado
// anteriormente (automaticamente) pelo próprio MIOLO.
    $bibMenu->SetTitle("Biblioteca");
    
// Adicionar opções ao menu
    $bibMenu->AddUserOption('BIB_ADMINISTRACAO',A_ACCESS,'Controle de Acesso'  , $module, 'main:admin:controleacesso');
    $bibMenu->AddUserOption('BIB_ADMINISTRACAO',A_ACCESS,'Administração'  , $module, 'main:admin');
    $bibMenu->AddUserOption('BIB_PRECATALOGACAO',A_ACCESS,'Catalogação'  , $module, 'main:catalogacao');
    $bibMenu->AddUserOption('BIB_BALCAO',A_ACCESS,'Empréstimos'  , $module, 'main:emprestimos');
    $bibMenu->AddUserOption('BIB_CIRCULACAO',A_ACCESS,'Circulação'  , $module, 'main:circulacao');
    $bibMenu->AddUserOption('BIB_SECRETARIA',A_ACCESS,'Secretaria'  , $module, 'main:secretaria');
    $bibMenu->AddSeparator();
    $bibMenu->AddUserOption('BIB_PRECATALOGACAO',A_ACCESS,'Pesquisa Aleph'  , $module, 'main:pesquisaaleph');
	$bibMenu->AddOption('Pesquisa Simples'  , $module, 'main:pesquisasimples');
    $bibMenu->AddOption('Pesquisa Multicampo'  , $module, 'main:pesquisamulticampo');
    $bibMenu->AddOption('Pesquisa Percorrer Índices'  , $module, 'main:pesquisaindice');
    $bibMenu->AddOption('Pesquisa Numérica'  , $module, 'main:pesquisanumerica');
    $bibMenu->AddUserOption('BIB_PESQTERMO',A_ACCESS,'Pesquisa Termo Específico'  , $module, 'main:pesquisatermo');
    $bibMenu->AddOption('Pesquisa por Unidade'  , $module, 'main:pesquisaunidade');
    $bibMenu->AddSeparator();
	$bibMenu->AddUserOption('BIBLIOTECA',A_ACCESS,'Empréstimos'  , $module, 'main:emprusuario');
    $bibMenu->AddUserOption('BIBLIOTECA',A_ACCESS,'Multas'  , $module, 'main:multausuario');
    $bibMenu->AddUserOption('BIBLIOTECA',A_ACCESS,'Renovação'  , $module, 'main:renovusuario');
    $bibMenu->AddUserOption('BIBLIOTECA',A_ACCESS,'Reservas'  , $module, 'main:resusuario');
*/    
	
	$close = $MIOLO->GetActionURL('common','main');
	$panel = new MActionPanel ('pnlBib', 'Biblioteca', '', $close);
	$panel->SetIconType('small');
	$panel->AddUserAction('BIB_ADMINISTRACAO',A_EXECUTE,'Controle de Acesso',$ui->GetImage('biblioteca','prorh_mini.png'),$module,'main:controleacesso');
	$panel->AddUserAction('BIB_ADMINISTRACAO',A_EXECUTE,'Administração',$ui->GetImage('biblioteca','figura02.png'),$module,'main:admin');
	$panel->AddUserAction('BIB_PRECATALOGACAO',A_EXECUTE,'Catalogação',$ui->GetImage('biblioteca','publicacao_mini.png'),$module,'main:catalogacao');
	$panel->AddUserAction('BIB_BALCAO',A_EXECUTE,'Empréstimos',$ui->GetImage('biblioteca','emprestimo_mini.png'),$module,'main:emprestimos');
	$panel->AddUserAction('BIB_CIRCULACAO',A_EXECUTE,'Circulação',$ui->GetImage('biblioteca','cedidos_mini.png'),$module,'main:circulacao');
	$panel->AddUserAction('BIB_SECRETARIA',A_EXECUTE,'Secretaria',$ui->GetImage('biblioteca','servidor3_mini.png'),$module,'main:secretaria');
	//$panel->AddAction('Editar', $ui->GetImage('exemplo', 'edit.png'), 'exemplo', $action, $aluno->idAluno, array ("form"=>"dados"));
	$panel->AddAction('Pesquisa Simples', $ui->GetImage('biblioteca','relacao_mini.png'),$module,'main:pesquisasimples');	
	$panel->AddAction('Pesquisa Multicampo', $ui->GetImage('biblioteca','relacao_mini.png'),$module,'main:pesquisamulticampo');	
	$panel->AddAction('Pesquisa Índices', $ui->GetImage('biblioteca','relacao_mini.png'),$module,'main:pesquisaindice');
	$panel->AddAction('Pesquisa Numérica' ,$ui->GetImage('biblioteca','relacao_mini.png'),$module,'main:pesquisanumerica');
	$panel->AddUserAction('BIB_PESQTERMO',A_EXECUTE,'Pesquisa Termo',$ui->GetImage('biblioteca','relacao_mini.png'),$module,'main:pesquisatermo');
	$panel->AddAction('Pesquisa por Unidade', $ui->GetImage('biblioteca','relacao_mini.png'),$module,'main:pesquisaunidade');
	$panel->AddUserAction('BIBLIOTECA',A_EXECUTE,'Usuário - Empréstimos',$ui->GetImage('biblioteca','emprestimo_mini.png'),$module,'main:emprusuario');
	$panel->AddUserAction('BIBLIOTECA',A_EXECUTE,'Usuário - Multas',$ui->GetImage('biblioteca','multa_mini.png'),$module,'main:multausuario');
	$panel->AddUserAction('BIBLIOTECA',A_EXECUTE,'Usuário - Renovação',$ui->GetImage('biblioteca','Download_fluo_mini.png'),$module,'main:renovusuario');
	$panel->AddUserAction('BIBLIOTECA',A_EXECUTE,'Usuário - Reservas',$ui->GetImage('biblioteca','cadeado_mini.png'),$module,'main:resusuario');
	//$panel->AddUserAction('BIB_ADMINISTRACAO', A_EXECUTE, 'Enviar e-mail', $ui->GetImage('biblioteca','periodoaquisitivo_mini.png'),$module,'main:enviaemailmulta');

        $panel->AddAction('Usuário - Penalidades',$ui->GetImage('biblioteca','cadeado_mini.png'),$module,'main:penalidade');
	
	$theme->insertContent($panel);
	
	
//$home = $MIOLO->getConf('home.url');


$ajuda = "

<font face=verdana size=2>
<ol>

<b><li>CONSULTAR O ACERVO DE TODAS AS BIBLIOTECAS DO SISTEMA</b><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:pesquisasimples\"> Consultar o acervo</a><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:pesquisa\"> Mais informações</a><br>

<br>

<b><li>CONSULTAR RESERVAS</b><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:resusuario\"> Consultar reservas</a><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:reservausu\"> Mais informações</a><br>
<br>

<b><li>RENOVAR O PRAZO DE DEVOLUÇÃO DE OBRAS EMPRESTADAS</b><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:renovusuario\"> Renovar empréstimos</a><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:renovausu\"> Mais informações</a><br>
<br>

<b><li>CONSULTAR AS SUAS MULTAS PENDENTES</b><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:multausuario\"> Consultar</a><br>
<br>

<b><li>CONSULTAR OS EMPRÉSTIMOS</b><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:emprusuario\"> Consultar</a><br>
<br>

<b><li>FAQ do SIGA</b><br>
<a href=\"{$home}/index.php?module=common&action=html:files:faq.html\"> Consultar</a><br>

</ol>
</font>
";
   
    $close = $MIOLO->GetActionURL('common','main');
    $pnlInicio = new MPanel('pnlInicio','O SIGA Biblioteca Permite:','', $close);
    $pnlInicio->AddControl(new MLabel($ajuda));
    $theme->InsertContent($pnlInicio);
    
	    
// chama o handler seguinte
   $a = $context ? $context->ShiftAction() : 'main';
   $handled = $MIOLO->InvokeHandler($module,$a);

?>
