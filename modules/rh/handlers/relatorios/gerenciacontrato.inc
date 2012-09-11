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
    $perms->CheckAccess('rh_relatorios',A_ACCESS,true);
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatórios de Gerência de Contratos','rh','main:relatorio:gerenciacontrato');
    $action = $context->ShiftAction();
    switch($action)
    {
        case 'terceirizados';
            $MIOLO->InvokeHandler('rh','relatorios/gerenciacontrato/terceirizados');
        break;
        case 'contratos';
            $MIOLO->InvokeHandler('rh','relatorios/gerenciacontrato/contratos');
        break;
        case 'local';
            $MIOLO->InvokeHandler('rh','relatorios/gerenciacontrato/local');
        break;
        default:
            $close = $MIOLO->GetActionURL('rh','main:relatorio');
            $panel = new ActionPanel('pnlRHRelatoriosFreq','Relatórios de Gerência de Contratos','',$close);
            $panel->setIconType('small');
            $panel->AddUserAction('relterceirizados',A_ACCESS,'Terceirizados',$ui->GetImage('rh','terceirizado_mini.png'),'rh','main:relatorio:gerenciacontrato:terceirizados');
            $panel->AddUserAction('relterceirizados',A_ACCESS,'Contratos',$ui->GetImage('rh','contrato_mini.png'),'rh','main:relatorio:gerenciacontrato:contratos');
            $panel->AddUserAction('relterceirizados',A_ACCESS,'Local de Trabalho',$ui->GetImage('rh','local_mini.png'),'rh','main:relatorio:gerenciacontrato:local');
            $theme->AppendContent($panel);
    }   
?>
