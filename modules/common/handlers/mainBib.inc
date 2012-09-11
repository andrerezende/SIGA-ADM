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
<?php

	$theme->ClearContent();


// obter acesso as classes de Interface de Usuario
    $ui = $MIOLO->GetUI();
	

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual ('tutorial3')
// a ultima opção da barra de navegação não é clicável, pois aponta para
// a página atualmente aberta. Nas páginas seguintes será clicável.
	$navbar->setLabelHome('SIGA');
    include_once($MIOLO->GetConf('home.modules').'/main_menu.inc');
		
	$close = $MIOLO->GetActionURL('common','main');
	$panel = new MActionPanel ('pnlBib', 'Biblioteca', '', $close);
	$panel->SetIconType('small');
	
	$panel->AddAction('Pesquisa Simples', $ui->GetImage('biblioteca','pesquisa_simples.png'),'common','main:pesquisasimples');	
	$panel->AddAction('Pesquisa Multicampo', $ui->GetImage('biblioteca','pesquisa_multicampo.png'),'common','main:pesquisamulticampo');	
	$panel->AddAction('Pesquisa Índices', $ui->GetImage('biblioteca','pesquisa_indices.png'),'common','main:pesquisaindice');
	$panel->AddAction('Pesquisa Numérica' ,$ui->GetImage('biblioteca','pesquisa_numerica.png'),'common','main:pesquisanumerica');
	$panel->AddAction('Pesquisa Termo',$ui->GetImage('biblioteca','pesquisa_termo.png'),'common','main:pesquisatermo');
	$panel->AddAction('Pesquisa por Unidade', $ui->GetImage('biblioteca','pesquisa_por_unidades.png'),'common','main:pesquisaunidade');
	
	$theme->insertContent($panel);
	
	
//$home = $MIOLO->getConf('home.url');


$ajuda = "

<font face=verdana size=2>
<ol>

<b><li>CONSULTAR O ACERVO DE TODAS AS BIBLIOTECAS DO SISTEMA</b><br>
<a href=\"{$home}/index.php?module=common&action=main:pesquisasimples\"> Consultar o acervo</a><br>
<a href=\"{$home}/index.php?module=common&action=main:pesquisa\"> Mais informações</a><br>

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
