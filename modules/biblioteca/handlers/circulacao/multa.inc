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
$navbar->AddOption('Multas', $module, 'main:circulacao:multa');
$theme->ClearContent();
$close = $MIOLO->GetActionURL('biblioteca','main:circulacao');
$Panel = new ActionPanel('pnl','Multas','',$close);
$Panel->AddUserAction('BIB_CIRCULACAO_TOT',A_ACCESS,'Nova Multa',$ui->GetImage($module,'nova_multa.png'),$module,'main:circulacao:multanova');
$Panel->AddAction('Multas Não Pagas',$ui->GetImage($module,'multas_nao_pagas.png'),$module,'main:circulacao:multapendente');
$Panel->AddAction('Pendentes por Usuário',$ui->GetImage($module,'pendentes_por_usuario.png'),$module,'main:circulacao:multapendenteporusuario');
$Panel->AddAction('Pendentes por Exemplar',$ui->GetImage($module,'pendentes_por_exemplar.png'),$module,'main:circulacao:multapendenteporexemplar');
$Panel->AddAction('Histórico por Operador',$ui->GetImage($module,'historico_por_operador.png'),$module,'main:circulacao:historicoporoperador');
$theme->AppendContent($Panel);
//$handled = $MIOLO->InvokeHandler($module, 'emprestimo/' . $context->ShiftAction());
?>
