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
    /**
     * Configuração Handler of RH Module
     * Handler de Configuração de Gerência de Contratos módulo de Recursos Humanos 
     * @package br.org.miolo.ufjf.rh
     */
    
    /**
     * Permissões necessárias
     *    RH
     */
    $perms->CheckAccess('rh',A_ACCESS,true);

    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Gerência de Contratos',$module,'main:gerenciacontrato');
    
    $action = $context->shiftAction();
    switch($action)
    {
        case 'terceirizados':
            $MIOLO->invokeHandler('rh','terceirizado/find');
            break;

        case 'localterceirizado':
        	$MIOLO->InvokeHandler('rh','localterceirizado/find');
        break;        		

        case 'contrato':
        	$MIOLO->InvokeHandler('rh','contrato/find');
        break; 
               	
        case 'relgerencia':
            $MIOLO->InvokeHandler('rh','relatorios/gerenciacontrato');
        break;
    
        default:
            $close = $MIOLO->GetActionURL($module,'main');

            $panel = new ActionPanel('pnlRHTables','Gerência de Contratos','',$close);
            $panel->SetIconType('small');
            $panel->AddUserAction('terceirizados',A_EXECUTE,'Terceirizados',$ui->GetImage('rh','terceirizado_mini.png'), $module,'main:terceirizado:find');
            $panel->AddUserAction('terceirizados',A_EXECUTE,'Local de Trabalho',$ui->GetImage('rh','local_mini.png'), $module,'main:localterceirizado:find');  
            $panel->AddUserAction('terceirizados',A_EXECUTE,'Contratos',$ui->GetImage('rh','contrato_mini.png'), $module,'main:contrato:find'); 
            //$panel->AddUserAction('relterceirizados',A_EXECUTE,'Relatórios',$ui->GetImage('rh','relatorio2_mini.png'), $module,'main:relatorio:gerenciacontrato');
            $theme->AppendContent($panel);

    }
?>
