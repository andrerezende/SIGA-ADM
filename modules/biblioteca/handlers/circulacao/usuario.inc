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

// obter acesso as classes de Interface de Usu?rio
    $ui = $MIOLO->GetUI();

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual 
    $navbar->AddOption('Usuários', $module, 'main:circulacao:usuario');

$theme->ClearContent();
//$theme->InsertContent(new ContentHeader('Módulo','Biblioteca: Circulação'));
$close = $MIOLO->GetActionURL('biblioteca','main:circulacao');
$Panel = new ActionPanel('pnl','Usuários','',$close);
$Panel->AddAction('Cadastro de Observações',$ui->GetImage($module,'cadastro_de_observacoes.png'),$module,'main:circulacao:usuario:observacoes');
$Panel->AddAction('Cadastro de Infrações',$ui->GetImage($module,'cadastro_de_infracoes.png'),$module,'main:circulacao:usuario:infracoes');
$Panel->AddAction('Validação de Cartão',$ui->GetImage($module,'validacao_de_cartao.png'),$module,'main:circulacao:usuario:validacao');
$Panel->AddAction('Liberação de Cartão',$ui->GetImage($module,'liberacao_de_cartao.png'),$module,'main:circulacao:usuario:liberacaocartao');
$Panel->AddUserAction('BIB_CIRCULACAO_TOT',A_ACCESS,'Alteração de Grupo',$ui->GetImage($module,'alteracao_de_grupos.png'),$module,'main:circulacao:usuario:alteragrupo');

$theme->AppendContent($Panel);
$handled = $MIOLO->InvokeHandler($module, 'circulacao/usuario/' . $context->ShiftAction());
?>
