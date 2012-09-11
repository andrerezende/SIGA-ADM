<?
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
    $perms->CheckAccess('rh',A_ACCESS,true);

    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Configuração',$module,'main:configuracao');
    
    $close = $MIOLO->GetActionURL($module,'main');

    $panel = new ActionPanel('pnlRHTables','Configuração do Recursos Humanos','',$close);
    $panel->SetIconType('small');
	$panel->AddUserAction('rh_configuracaoclasse',A_ACCESS,'Classe',$ui->GetImage('rh','classe.png'),$module,'main:classe:find');
	$panel->AddUserAction('rh_configuracaogrupocargo',A_ACCESS,'Grupo Cargo',$ui->GetImage('rh','grupocargo.png'),$module,'main:grupocargo:find');
	$panel->AddUserAction('rh_configuracaodiplomalegal',A_ACCESS,'Diploma Legal',$ui->GetImage('rh','diplomalegal.png'),$module,'main:diplomalegal:find');
	$panel->AddUserAction('rh_configuracaopublicacao',A_ACCESS,'Publicação',$ui->GetImage('rh','publicacao.png'),$module,'main:publicacao:find');
//	$panel->AddUserAction('rh_configuracaovaga',A_ACCESS,'Vaga',$ui->GetImage($module,'vaga.png'),$module,'main:vaga:find');
	$panel->AddUserAction('rh_configuracaosituacao',A_ACCESS,'Situação Funcional',$ui->GetImage($module,'situacaofuncional.png'),$module,'main:situacaofuncional:find');
	$panel->AddUserAction('rh_configuracaojornada',A_ACCESS,'Jornada',$ui->GetImage($module,'jornada.png'),$module,'main:jornada:find');
//    $panel->AddBreak();
	$panel->AddUserAction('rh_configuracaoformacao',A_ACCESS,'Formação',$ui->GetImage('rh','formacao.png'),$module,'main:formacao:find');
	$panel->AddUserAction('rh_configuracaogrupoocorrencia',A_ACCESS,'Grupo Ocorrência',$ui->GetImage('rh','ocorrencia.png'),$module,'main:grupoocorrencia:find');
//	$panel->AddUserAction('rh_configuracaoinstalacao',A_ACCESS,'Instalação',$ui->GetImage('','configure.png'),$module,'main:setup');
	$panel->AddUserAction('rh_configuracaotipolicafast',A_ACCESS,'Tipo Licafast',$ui->GetImage('rh','licenca_mini.png'),$module,'main:tipolicafast:find');
	$panel->AddUserAction('rh_configuracaodatalimiteferias',A_ACCESS,'Data Limite para pedido de Férias ',$ui->GetImage('rh','cal.gif'),$module,'main:datalimiteferias');
	$panel->AddUserAction('rh_configuracaofuncaoterceirizado',A_ACCESS,'Função (Terceirizados)',$ui->GetImage('rh','funcao_mini.png'),$module,'main:funcaoterceirizado:find');

    $theme->AppendContent($panel);
?>
