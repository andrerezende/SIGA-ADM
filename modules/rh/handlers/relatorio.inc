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
     * Tables Handler of RH Module
     * Handler de Relatórios do módulo de Recursos Humanos 
     * @package br.org.miolo.ufjf.rh
     */
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatórios','rh','main:relatorio');
    $action = $context->ShiftAction();
    switch($action)
    {
        case 'licafast':
            $MIOLO->InvokeHandler('rh','relatorios/licafast');
        break;
    
        case 'frequencia':
            $MIOLO->InvokeHandler('rh','relatorios/frequencia');
        break;
        
        case 'geral':
            $MIOLO->InvokeHandler('rh','relatorios/geral');
        break;
    
        case 'funcionariosCedidos':
            $MIOLO->InvokeHandler('rh','relatorios/funcionariosCedidos');
        break;
        
        case 'ferias':
            $MIOLO->InvokeHandler('rh','relatorios/ferias');
        break;
        
        case 'adicionais':
            $MIOLO->InvokeHandler('rh','relatorios/adicionais');
        break;
    
        case 'aniversariantes':
            $MIOLO->InvokeHandler('rh','relatorios/aniversariantes');
        break;
        
        case 'vagas':
            $MIOLO->InvokeHandler('rh','relatorios/vagas');
        break;
        
        case 'temporarios':
            $MIOLO->InvokeHandler('rh','relatorios/temporarios');
        break;

        case 'gerenciacontrato':
            $MIOLO->InvokeHandler('rh','relatorios/gerenciacontrato');
        break;    
        
        case 'contagem':
            $MIOLO->InvokeHandler('rh','relatorios/contagem');
        break;              

        case 'mudancasambiente':
            $navbar->AddOption('Histórico de Mudanças de Ambiente', 'rh', 'main:relatorios:mudancasambiente');
            $form = $ui->GetForm('rh','frmrepMudancasAmbiente',NULL,'relatorios/ambiente');
            $theme->InsertContent($form);
        break;        

        case 'ambientesdostas':
            $navbar->AddOption('Ambientes atuais dos TAs', 'rh', 'main:relatorios:ambientesdostas');
            $form = $ui->GetForm('rh','frmrepAmbientesdosTAs',NULL,'relatorios/ambiente');
            $theme->InsertContent($form);
        break;        

        case 'relpensionistas':
            $MIOLO->InvokeHandler('rh','relatorios/relpensionistas');
        break;

        case 'etiquetas':
            $MIOLO->InvokeHandler('rh','etiquetas');
        break;    
        
        case 'dadosBancarios':
            $MIOLO->InvokeHandler('rh','relatorios/dadosBancarios');
        break;    

        case 'gerador':
            $MIOLO->InvokeHandler('rh','relatorios/gerador');
        break;    

        case 'proximaProgressao':
            $MIOLO->InvokeHandler('rh','relatorios/proximaProgressao');
        break;

        case 'gerenciais':
            $MIOLO->InvokeHandler('rh','relatorios/gerenciais');
        break;
        
        case 'quantitativos':
            $MIOLO->InvokeHandler('rh','relatorios/quantitativos');
        break;    

        case 'aposentadorias':
            $MIOLO->InvokeHandler('rh','relatorios/aposentadorias');
        break;
        /*
        case 'prorh':
            $MIOLO->InvokeHandler('rh','relatorios/prorh');
        break;
        case 'intersticio':
            $MIOLO->InvokeHandler('rh','relatorios/intersticio');
        break;
        */
    
        default:
            $close = $MIOLO->GetActionURL('rh','main');
            $panel = new ActionPanel('pnlRHRelatorios','SIGA-RH - Relatórios','',$close);
            $panel->setIconType('small');
            $panel->AddUserAction('rh_relfrequencia'     ,A_ACCESS,'Freqüência'           ,$ui->GetImage('rh','frequencia_mini.png'     ),'rh','main:relatorio:frequencia');
            $panel->AddUserAction('rh_relcedidos'        ,A_ACCESS,'Servidores Cedidos'   ,$ui->GetImage('rh','cedidos_mini.png'        ),'rh','main:relatorio:funcionariosCedidos');
            $panel->AddUserAction('rh_rellicafast'       ,A_ACCESS,'Licença Afastamento'  ,$ui->GetImage('rh','licenca_mini.png'        ),'rh','main:relatorio:licafast');
            $panel->AddUserAction('rh_relferias'         ,A_ACCESS,'Férias'               ,$ui->GetImage('rh','ferias_mini2.png'        ),'rh','main:relatorio:ferias');
            $panel->AddUserAction('rh_relgeral'          ,A_ACCESS,'Geral'                ,$ui->GetImage('rh','geral_mini.png'          ),'rh','main:relatorio:geral');
            $panel->AddUserAction('rh_reladicionais'     ,A_ACCESS,'Adicionais'           ,$ui->GetImage('rh','adicional_mini.png'      ),'rh','main:relatorio:adicionais');
            //anel->AddUserAction(''                     ,A_ACCESS,'Pro-rh',$ui->GetImage('rh','prorh_mini.png'),'rh','main:relatorio:prorh');
            //anel->AddUserAction(''                     ,A_ACCESS,'Interstício para Progressão',$ui->GetImage('rh','intersticio_mini.png'),'rh','main:relatorio:intersticio');
            $panel->AddUserAction('rh_relaniversariantes',A_ACCESS,'Aniversariantes'      ,$ui->GetImage('rh','aniversariantes_mini.png'),'rh','main:relatorio:aniversariantes');
            //$panel->AddUserAction('rh_relvagas'          ,A_ACCESS,'Vagas'                ,$ui->GetImage('rh','vaga_mini.png'           ),'rh','main:relatorio:vagas');
            //$panel->AddUserAction('rh_reltemporarios'    ,A_ACCESS,'Contratos Temporários',$ui->GetImage('rh','temporarios_mini.png'   ),'rh','main:relatorio:temporarios');
            //$panel->AddUserAction('terceirizados'        ,A_ACCESS,'Gerência de Contratos',$ui->GetImage('rh','gerenciacontrato_mini.png'),'rh','main:relatorio:gerenciacontrato');
            $panel->AddUserAction('rh_relcontagem'       ,A_ACCESS,'Contagem de Tempo'    ,$ui->GetImage('rh','mapa_tempo_mini.png'     ),'rh','main:relatorio:contagem');
            $panel->AddUserAction('rh_relambiente'       ,A_ACCESS,'Mudanças de Ambiente' ,$ui->GetImage('rh','geral_mini.png'          ),'rh','main:relatorio:mudancasambiente');
            $panel->AddUserAction('rh_relambiente'       ,A_ACCESS,'Ambientes dos TAs'    ,$ui->GetImage('rh','geral_mini.png'          ),'rh','main:relatorio:ambientesdostas');
            //$panel->AddUserAction('rh_relgeral'          ,A_ACCESS,'Pensionistas'         ,$ui->GetImage('rh','pensionistas_mini.png'   ),'rh','main:relatorio:relpensionistas');
            //$panel->AddUserAction('rh_etiquetas'         ,A_ACCESS,'Etiquetas'            ,$ui->GetImage('rh','etiquetas_mini.png'      ),'rh','main:etiquetas');
            //$panel->AddUserAction('rh_reldadosbancarios' ,A_ACCESS,'Dados Bancários'      ,$ui->GetImage('rh','banco_mini.png'          ),'rh','main:relatorio:dadosBancarios');
            //$panel->AddUserAction('rh_relgerador'        ,A_ACCESS,'Gerador Fita Espelho' ,$ui->GetImage('rh','gerador_mini.png'        ),'rh','main:relatorio:gerador');
            //$panel->AddUserAction('rh_relprogmerito'     ,A_ACCESS,'Progressão por Mérito',$ui->GetImage('rh','progmerito_mini.png'     ),'rh','main:relatorio:proximaProgressao');
           // $panel->AddUserAction('rh_relgerenciais'     ,A_ACCESS,'Gerenciais'           ,$ui->GetImage('rh','gerenciais_mini.png'     ),'rh','main:relatorio:gerenciais');
            //$panel->AddUserAction('rh_relquantitativos'  ,A_ACCESS,'Quantitativos'        ,$ui->GetImage('rh','admin_mini.png'          ),'rh','main:relatorio:quantitativos');
            //$panel->AddUserAction('rh_relaposentadorias' ,A_ACCESS,'Aposentadorias'       ,$ui->GetImage('rh','aposentadoria_mini.png'  ),'rh','main:relatorio:aposentadorias');
            $panel->AddBreak();
            $theme->AppendContent($panel);
    }   
?>
