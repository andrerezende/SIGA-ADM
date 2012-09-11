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
$perms->CheckAccess('BIB_CIRCULACAO_TOT',A_ACCESS,true);

 
    $ui = $MIOLO->GetUI();

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual 
    $navbar->AddOption('Relatórios', $module, 'main:circulacao:relatorio');

$theme->ClearContent();
//$theme->InsertContent(new ContentHeader('Módulo','Biblioteca: Circulação'));
$close = $MIOLO->GetActionURL('biblioteca','main:circulacao');
$Panel = new ActionPanel('pnl','Relatórios','',$close);
$Panel->AddAction('Relatório de Obras por Classe',$ui->GetImage($module,'classe_mini.png'),$module,'main:circulacao:relatorio:obrasporclasse');
$Panel->AddAction('Relatório de Obras por Unidade e Gênero',$ui->GetImage($module,'ocupacaovaga_mini.png'),$module,'main:circulacao:relatorio:obrasporunidade');
$Panel->AddAction('Empréstimos por Período',$ui->GetImage($module,'emprestimo_mini.png'),$module,'main:circulacao:relatorio:emprestimosporperiodo');
$Panel->AddAction('Empréstimos por Período Sintético',$ui->GetImage($module,'emprestimo_mini.png'),$module,'main:circulacao:relatorio:emprestimoSintetico');
//$Panel->AddAction('Empréstimos por Período Analitico',$ui->GetImage($module,'emprestimo_mini.png'),$module,'main:circulacao:relatorio:emprestimoAnalitico');
$Panel->AddAction('Reservas por Período',$ui->GetImage($module,'reserva_mini.png'),$module,'main:circulacao:relatorio:reservasporperiodo');
$Panel->AddAction('Obras por período e operação',$ui->GetImage($module,'obrasporperiodo_mini.png'),$module,'main:circulacao:relatorio:obrasporperiodoeoperacao');
$Panel->AddAction('Exemplares por período e operação',$ui->GetImage($module,'publicacao_mini.png'),$module,'main:circulacao:relatorio:exemplaresporperiodoeoperacao');
$Panel->AddAction('Multas por período',$ui->GetImage($module,'multasperiodo_mini.png'),$module,'main:circulacao:relatorio:multasporperiodo');
$Panel->AddAction('Quantidade de Obras e Exemplares',$ui->GetImage($module,'ocupacaovaga_mini.png'),$module,'main:circulacao:relatorio:obraseexemplaresporunidade');
$Panel->AddAction('Relatório por Áreas de Conhecimento CNPq',$ui->GetImage($module,'cnpq_mini.png'),$module,'main:circulacao:relatorio:relatoriocnpq');


$theme->AppendContent($Panel);
$handled = $MIOLO->InvokeHandler($module, 'circulacao/relatorio/' . $context->ShiftAction());
?>
