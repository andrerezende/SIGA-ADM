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

	/*$theme->ClearContent();
	//$page->Redirect($MIOLO->GetConf('common','main:main2'));

// obter acesso as classes de Interface de Usuario
    $ui = $MIOLO->GetUI();
	

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual ('tutorial3')
// a ultima opção da barra de navegação não é clicável, pois aponta para
// a página atualmente aberta. Nas páginas seguintes será clicável.
	$navbar->setLabelHome('SIGA');

	$panel = new MActionPanel ('pnlBib', 'Sistema Integrado de Gestão Acadêmica', '', $close);
	$panel->SetIconType('small');
	
//	$panel->AddAction('Pesquisar Acervo', $ui->GetImage('biblioteca','pesquisa_alpeh.png'),'common','main:mainBib');	
	$panel->AddAction('Pesquisar Processos', $ui->GetImageTheme('','icons/processos.png'),'protocolo','processospub');	
	$panel->AddAction('Login', $ui->GetImage('common','login.png'),'common','main:main2');
	
	$theme->insertContent($panel);
	
	
  $close = $MIOLO->GetActionURL('common','main:main');*/
  	    
// chama o handler seguinte
   $a = $context ? $context->ShiftAction() : 'main';
   $handled = $MIOLO->InvokeHandler($module,$a);


?>
