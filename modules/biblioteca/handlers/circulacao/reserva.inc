<?PHP
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
$perms->CheckAccess('BIB_CIRCULACAO',A_ACCESS,true);
$ui = $MIOLO->GetUI();
$navbar->AddOption('Reservas', $module, 'main:circulacao:reserva');
$theme->ClearContent();

$close = $MIOLO->GetActionURL('biblioteca','main:circulacao');
$Panel = new ActionPanel('pnl','Reservas','',$close);

$Panel->AddAction('Em Espera por Usuário',$ui->GetImage($module,'em_espera_por_usuario.png'),$module,'main:circulacao:esperaporusuario');
$Panel->AddAction('Em Espera por Exemplar',$ui->GetImage($module,'em_espera_por_exemplar.png'),$module,'main:circulacao:esperaporexemplar');
$Panel->AddAction('Atendidas por Usuário',$ui->GetImage($module,'atendidas_por_usuario.png'),$module,'main:circulacao:atendidaporusuario');
$Panel->AddAction('Atendidas por Exemplar',$ui->GetImage($module,'atendidas_por_exemplar.png'),$module,'main:circulacao:atendidaporexemplar');
$Panel->AddAction('Atendidas por Biblioteca',$ui->GetImage($module,'atendidas_por_biblioteca.png'),$module,'main:circulacao:atendidaporbiblioteca');

$theme->AppendContent($Panel);
$handled = $MIOLO->InvokeHandler($module, 'reserva/' . $context->ShiftAction());
?>
