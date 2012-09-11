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
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatório Licenças/Afastamentos', 'rh', 'main:relatorio:licafast');
    $handled = $MIOLO->InvokeHandler('rh','relatorios/licafast/' . $context->shiftAction() );
    if ( ! $handled )
    {
        $close = $MIOLO->GetActionURL('rh','main:relatorio');
        $panel = new MActionPanel('pnlLicenca','Licenças em Geral(setor) - Licenças/Afastamento(mês/ano) - Licenças de Saúde','',$close);
        $panel->setIconType('small');
        $panel->setControlSize('400px','25px');
        $panel->AddUserAction('rh_info',A_ACCESS,'Geral (por Setor)',$ui->GetImage('rh','licgeral_mini.png'),'rh','main:relatorio:licafast:geral');
        $panel->AddBreak();
        $panel->AddUserAction('rh_licsaude',A_ACCESS,'Licenças de Saúde',$ui->GetImage('rh','saude_mini.png'),'rh','main:relatorio:licafast:saude');
        $panel->AddBreak();
        $panel->AddUserAction('rh_rellicafast',A_ACCESS,'Licenças/Afastamentos (Mês/Ano)',$ui->GetImage('rh','licenca_mini.png'),'rh','main:relatorio:licafast:mesano');
        $panel->AddBreak();
        //$panel->AddUserAction('rh_faltasnaojustificadas',A_ACCESS,'Faltas Não Justificadas',$ui->GetImage('rh','faltas_mini.png'),'rh','main:relatorio:licafast:faltas');
        $theme->SetContent($panel);
    }
?>
