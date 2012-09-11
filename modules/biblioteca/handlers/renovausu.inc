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
// obter acesso as classes de Interface de Usu?rio
    $ui = $MIOLO->GetUI();

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual ('tutorial3')
    $navbar->AddOption('Renovação', $module, 'main');


// a ultima opção da barra de navegação não é clicável, pois aponta para
// a página atualmente aberta. Nas páginas seguintes será clicável.
    
/* definir um conteúdo
    $content = "<h1>Siga Biblioteca</h1>";

 colocando conteúdo página
    $theme->SetContent($content);
*/

// cria o menu
// $bibMenu = &$theme->GetMenu('Biblioteca');

// definindo título de menu. O objeto $admMenu foi criado
// anteriormente (automaticamente) pelo próprio MIOLO.
// $bibMenu->SetTitle("Biblioteca");

$home = $MIOLO->getConf('home.url');

$ajuda = "

<font face=verdana size=2>
<br>
<b><u><p align='center'>RENOVAR O PRAZO DE DEVOLUÇÃO DE OBRAS EMPRESTADAS</u></b><br><br><br>
Nessa opção, você pode renovar o prazo de devolução dos exemplares que lhe foram emprestados.<br><br>
Esta renovação deve ser realizada 24 horas antes do vencimento do empréstimo e só se concretizará se não houver <b>RESERVA</b> para a obra em questão.<br><br>
<b>OBS: </b> esta operação deve ser realizada para cada exemplar a ser renovado.<br><br><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main:renovusuario\"> Renovar</a><br><br>
<a href=\"{$home}/index.php?module=biblioteca&action=main\">Voltar</a><br><br>

</font>
";

$theme->SetContent(new label ($ajuda));

/*
 Adicionar opções ao menu
	$bibMenu->AddUserOption('BIB_ADMINISTRACAO',A_ACCESS,'Administração'  , $module, 'main:admin');
    $bibMenu->AddUserOption('BIB_CATALOGACAO',A_ACCESS,'Catalogação'  , $module, 'main:catalogacao');
    $bibMenu->AddUserOption('BIB_BALCAO',A_ACCESS,'Empréstimos'  , $module, 'main:emprestimos');
    $bibMenu->AddUserOption('BIB_CIRCULACAO',A_ACCESS,'Circulação'  , $module, 'main:circulacao');
    $bibMenu->AddSeparator();
    $bibMenu->AddOption('Pesquisa Simples'  , $module, 'main:pesquisasimples');
    $bibMenu->AddOption('Pesquisa Multicampo'  , $module, 'main:pesquisamulticampo');
    $bibMenu->AddOption('Pesquisa Percorrer Índices'  , $module, 'main:pesquisaindice');
    $bibMenu->AddOption('Pesquisa Numérica'  , $module, 'main:pesquisanumerica');
    $bibMenu->AddSeparator();
	$bibMenu->AddOption('Empréstimos'  , $module, 'main:emprusuario');
    $bibMenu->AddOption('Multas'  , $module, 'main:multausuario');
    $bibMenu->AddOption('Renovação'  , $module, 'main:renovusuario');
    $bibMenu->AddOption('Reservas'  , $module, 'main:resusuario');
*/

// chama o handler seguinte
$a = $context ? $context->ShiftAction() : 'main';
   $handled = $MIOLO->InvokeHandler($module,$a);

?>
