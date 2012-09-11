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
$navbar->AddOption('Empréstimos', $module, 'main:circulacao:emprestimo');
$theme->ClearContent();
//$theme->InsertContent(new ContentHeader('Módulo','Biblioteca: Circulação'));
$close = $MIOLO->GetActionURL('biblioteca','main:circulacao');
$Panel = new ActionPanel('pnl','Empréstimos','',$close);
//$Panel->AddAction('Novo',$ui->GetImage('','button_edit.png'),$module,'main:circulacao:novo');
$Panel->AddAction('Pendentes',$ui->GetImage($module,'pendentes.png'),$module,'main:circulacao:pendentes');
$Panel->AddAction('Pendentes por Usuário',$ui->GetImage($module,'pendentesusuario.png'),$module,'main:circulacao:pendentesporusuario');
$Panel->AddAction('Pendentes por Exemplar',$ui->GetImage($module,'pendenteexemplar.png'),$module,'main:circulacao:pendentesporexemplar');
$Panel->AddAction('Atrasados',$ui->GetImage($module,'atrasados.png'),$module,'main:circulacao:atrasado');
$Panel->AddAction('Carta de Cobrança',$ui->GetImage($module,'atrasados.png'),$module,'main:circulacao:cartaCobranca');
$Panel->AddAction('Histórico por Usuário',$ui->GetImage($module,'histusuario.png'),$module,'main:circulacao:historicoporusuario');
$Panel->AddAction('Histórico por Exemplar',$ui->GetImage($module,'histexemplar.png'),$module,'main:circulacao:historicoporexemplar');
$Panel->AddUserAction('BIB_CIRCULACAO_TOT',A_ACCESS,'Alterar Previsão de Devolução',$ui->GetImage($module,'histexemplar.png'),$module,'main:circulacao:alterarprevisaodevolucao');

$theme->AppendContent($Panel);
$handled = $MIOLO->InvokeHandler($module, 'emprestimo/' . $context->ShiftAction());
?>
