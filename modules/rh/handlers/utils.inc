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
    /**
     * Configuração Handler of RH Module
     * Handler de Configuração do módulo de Recursos Humanos 
     * @package br.org.miolo.ufjf.rh
     */
    
    /**
     * Permissões necessárias
     *    RH
     */
    $perms->CheckAccess('rh',A_ACCESS,TRUE);

    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Utilidades',$module,'main:utils');
    
    $action = $context->shiftAction();
    switch($action)
    {
        case 'remocao':
            $MIOLO->invokeHandler('rh','utils/remocao');
            break;
    
        default:
            $close = $MIOLO->GetActionURL($module,'main');

            $panel = new ActionPanel('pnlRHTables','Utilidades','',$close);
            $panel->SetIconType('small');
            $panel->AddUserAction('rh_remocao_multipla',A_EXECUTE,'Remoção Múltipla'    ,$ui->GetImage('rh','remocao_mini.png'),$module ,'main:utils:remocao');
            //$panel->AddUserAction('setor'              ,A_EXECUTE,'Setores'             ,$ui->GetImage('rh','setor_mini.png'  ),'common','main:setor:find'   );
            $panel->AddUserAction('vagas'              ,A_EXECUTE,'Ocupação de Vagas'   ,$ui->GetImage('rh','setor_mini.png'  ),$module ,'main:vagautil:find');
            $theme->AppendContent($panel);
    }
?>
