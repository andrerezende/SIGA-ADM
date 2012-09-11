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
    $navbar->AddOption('Capacitação',$module,'main:capacitacao');
    
    $action = $context->shiftAction();
    switch($action)
    {
        case 'formulario':
            $MIOLO->invokeHandler('rh','capacitacao/formulario');
            break;

        case 'inscricoes':
            $MIOLO->invokeHandler('rh','capacitacao/inscricoes');
            break;

        case 'inscritos':
            $MIOLO->invokeHandler('rh','capacitacao/inscritos');
            break;

        case 'autorizacao':
            $MIOLO->invokeHandler('rh','capacitacao/autorizacao');
            break;

        case 'confirmacao':
            $MIOLO->invokeHandler('rh','capacitacao/confirmacao');
            break;

        case 'remocao':
            $MIOLO->invokeHandler('rh','capacitacao/remocao');
            break;

        case 'cursos':
            $MIOLO->invokeHandler('rh','capacitacao/cursos');
            break;

        case 'cursosexternos':
            $MIOLO->invokeHandler('rh','capacitacao/cursosexternos');
            break;

        case 'modulos':
            $MIOLO->invokeHandler('rh','capacitacao/modulos');
            break;

        case 'estatisticas':
            $MIOLO->invokeHandler('rh','capacitacao/estatisticas');
            break;
    
        case 'repconcluido':
            $MIOLO->invokeHandler('rh','capacitacao/repconcluido');
            break;

        default:
            $close = $MIOLO->GetActionURL($module,'main');
//		    $aviso = new MLabel("Consulte sempre a página da PRORH (http://www.ufjf.br/prorh) para obter informações sobre a programação das ações de capacitação.",'red',true); 
//		    $aviso = new MLabel("A PRORH informa o período de REABERTURA DE INSCRIÇÕES para vagas remanescentes dos módulos de capacitação a serem oferecidos no primeiro semestre de 2008: do dia 07/04, às 10h até o dia 14/04/2008, às 10h. Informações:(32) 2102 - 3937 ou www.ufjf.br/prorh",'red',true); 
//		    $aviso = new MLabel("A PRORH informa que as incrições para a Visita Técnica à Siderúrugica ArcelorMittal (Belgo Mineira) iniciam-se às 09h do dia 26 de maio e terão previsão de término às 09h do dia 28 de maio de 2008",'red',true); 
            $urlStep = $MIOLO->GetActionURL('rh','html:files:capacitacao.htm');
            $steps = new MOpenWindow('','passo-a-passo',$urlStep);
		    $roteiro = new MLabel("Roteiro " . $steps->generate() . " para inscrições nos cursos/atividades promovidos pela PRORH.",'blue',true); 
            $panel = new MActionPanel('pnlCapacitacao','Capacitação','',$close);
            $panel->SetIconType('small');
            $panel->AddAction('Formulário de Inscrição',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:formulario');
            $panel->AddAction('Situação das Inscrições',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:inscricoes');
            $panel->AddAction('Anuência',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:autorizacao');
            $panel->AddAction('Relação de Inscritos Confirmados/Concluídos',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:inscritos');
            $panel->AddUserAction('rh_capacitacaocursos',A_EXECUTE,'Confirmação PRORH',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:confirmacao');
            $panel->AddUserAction('rh_capacitacaocursos',A_EXECUTE,'Remoção de Inscrições',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:remocao');
            $panel->AddUserAction('rh_capacitacaocursos',A_EXECUTE,'Estatísticas',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:estatisticas');
            $panel->AddUserAction('rh_capacitacaocursos',A_EXECUTE,'Cursos',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:cursos');
            $panel->AddUserAction('rh_capacitacaocursos',A_EXECUTE,'Módulos',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:modulos');
            $panel->AddUserAction('rh_capacitacaocursos',A_EXECUTE,'Relação Concluídos',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:repconcluido');
            $panel->AddUserAction('rh_capacitacaocursosexternos',A_EXECUTE,'Cursos Externos',$ui->GetImage('rh','capacitacao_mini.png'), $module,'main:capacitacao:cursosexternos');
			$content[] = $aviso;
			$content[] = new MSpacer('7px');
			$content[] = $roteiro;
			$content[] = new MSpacer('10px');
			$content[] = $panel;
            $theme->AppendContent($content);
    }
?>
