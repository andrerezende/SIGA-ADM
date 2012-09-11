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
$perms->CheckAccess('BIB_BALCAO',A_ACCESS,true);

// obter acesso as classes de Interface de Usu?rio
    $ui = $MIOLO->GetUI();

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual ('tutorial3')
    $navbar->AddOption('Empréstimos', $module, 'main:emprestimos');

$theme->ClearContent();
//$theme->InsertContent(new ContentHeader('Módulo','Biblioteca'));
$close = $MIOLO->GetActionURL('biblioteca','main');
$Panel = new ActionPanel('pnlEmprestimos','Empréstimos','',$close);
$Panel->AddAction('Empréstimo',$ui->GetImage($module,'emprestimo.png'),$module,'main:emprestimos:emprestimo');
$Panel->AddAction('Empréstimo no Recinto',$ui->GetImage($module,'emprestimo_recinto.png'),$module,'main:emprestimos:emprestimorecinto');
$Panel->AddAction('Devolução',$ui->GetImage($module,'devolucao.png'),$module,'main:emprestimos:devolucao');
$Panel->AddAction('Multa',$ui->GetImage($module,'multa.png'),$module,'main:emprestimos:multa');
$Panel->AddAction('Verificar Situação de Usuário',$ui->GetImage($module,'verificar_sit_user.png'),$module,'main:emprestimos:situacaousuario');
$Panel->AddAction('Verificar Situação de Exemplar',$ui->GetImage($module,'verificar_sit_exemp.png'),$module,'main:emprestimos:situacaoexemplar');
$Panel->AddAction('Histórico por Usuário',$ui->GetImage($module,'historico_user.png'),$module,'main:emprestimos:historicoporusuario');
$Panel->AddAction('Histórico por Exemplar',$ui->GetImage($module,'historico_exemp.png'),$module,'main:emprestimos:historicoporexemplar');

$theme->AppendContent($Panel);
$handled = $MIOLO->InvokeHandler($module, 'emprestimos/' . $context->ShiftAction());

?>
