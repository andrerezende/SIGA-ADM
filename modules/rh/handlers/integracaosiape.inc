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
    $perms->CheckAccess('rh',A_ACCESS,true);
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Integração','rh','main:integracaosiape');
    
    $action = $context->ShiftAction();

    $auth = $this->manager->getAuth();
   
    switch($action)
    {
        case 'importacao':
            $MIOLO->InvokeHandler('rh','integracaosiape/importacao');
        break;

        case 'exportacao':
            $MIOLO->InvokeHandler('rh','integracaosiape/exportacao');
        break;

        default:
            $close = $MIOLO->GetActionURL('rh','main');
            $panel = new ActionPanel('pnlRHIntegracaoSIAPE','SIGA-RH - Integração','',$close);
            $panel->setIconType('small');
            $panel->AddUserAction('rh_integracaosiape',A_ACCESS,'Importação',$ui->GetImage('rh','importacao_mini1.png'),'rh','main:integracaosiape:importacao');
            $panel->AddBreak();            
            $panel->AddUserAction('rh_integracaosiape',A_ACCESS,'Exportação',$ui->GetImage('rh','exportacao_mini1.png'),'rh','main:integracaosiape:exportacao');
            $panel->AddBreak();
            $theme->AppendContent($panel);
    }   
?>
