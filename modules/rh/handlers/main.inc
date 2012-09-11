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
    /**
     * Main Handler of RH Module
     * Handler principal do módulo de Recursos Humanos 
     * @package br.org.miolo.ufjf.rh
     */
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Recursos Humanos',$module,'main');
    $navbar->setBase($MIOLO->getConf('home.url').'/index.php');
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
    $funcionario = $MIOLO->getBusiness('rh','funcionario');
    if (!$handled)
    {
        $close = $MIOLO->GetActionURL('common','main');
        $panel = new MActionPanel('pnlRH','Recursos Humanos','',$close);
        $panel->SetIconType('small');
        $panel->AddUserAction('rh_pessoas_geral',A_EXECUTE,'Pessoas'                          ,$ui->GetImage('rh','pessoa_mini.png')          ,$module,'main:pessoa:find');
        $panel->AddUserAction('rh_servidor'     ,A_EXECUTE,'Servidores'                       ,$ui->GetImage('rh','servidor_mini.png')        ,$module,'main:funcionario:find');  
	//$panel->AddUserAction('rh_servidorsituacao',A_EXECUTE,'Situação Servidores'           ,$ui->GetImage('rh','servidor_mini.png')        ,$module,'main:funcionario:findconsulta');
        $panel->AddUserAction('terceirizados'   ,A_ACCESS ,'Gerência de Contratos'            ,$ui->GetImage('rh','gerenciacontrato_mini.png'),$module,'main:gerenciacontrato');    
        $panel->AddUserAction('rh_relatorios'   ,A_EXECUTE,'Relatórios'                       ,$ui->GetImage('rh','relatorio2_mini.png')      ,$module,'main:relatorio');
        $panel->AddUserAction('rh_utils'        ,A_EXECUTE,'Utilidades'                       ,$ui->GetImage('rh','utils_mini.png')           ,$module,'main:utils');
        $panel->AddUserAction('rh_meusdados'    ,A_EXECUTE,'Meus Dados'                       ,$ui->GetImage('rh','meusdados_mini.png')       ,$module,'main:vinculo',$funcionario->GetVinculoByPessoa($MIOLO->getAuth()->login->idkey));
	//$panel->AddUserAction('rh_meusdados'    ,A_EXECUTE,'Meus Dados'                       ,$ui->GetImage('rh','meusdados_mini.png')       ,$module,'main:vinculo',$MIOLO->getAuth()->login->id);
        //$panel->AddUserAction('rh_meusdados'    ,A_EXECUTE,'Organograma'                      ,$ui->GetImage('rh','utils_mini.png')           ,$module,'html:files:organograma.pdf');
        $panel->AddUserAction('rh_integracao'   ,A_EXECUTE,'Integração'						  ,$ui->GetImage('rh','integracaosiape_mini.png') ,$module,'main:integracaosiape',$MIOLO->getAuth()->login->id);
        //$panel->AddUserAction('rh_download'     ,A_EXECUTE,'Download'                         ,$ui->GetImage('rh','download_mini.png')        ,$module,'main:download',$MIOLO->getAuth()->login->id);
        $panel->AddUserAction('rh_meusdados'    ,A_EXECUTE,'Capacitação'                      ,$ui->GetImage('rh','servidor_mini.png')        ,$module,'main:capacitacao');
        //$panel->AddUserAction('trocasenhaserv'  ,A_ACCESS ,'Troca Senha de Usuário'           ,$ui->GetImage('common','trocasenha.png')       ,'rh'   ,'main:trocasenha');
        $panel->AddUserAction('rh_configuracao' ,A_ACCESS ,'Configuração'                     ,$ui->GetImage('rh','config_mini.png')           ,'rh'   ,'main:configuracao');
        $panel->AddUserAction('rh_vagas'        ,A_EXECUTE,'Vagas'                            ,$ui->GetImage('rh','vaga_mini.png')            ,$module,'main:vaga:find');
       // $panel->AddUserAction('rh_proades'      ,A_EXECUTE,'Avaliação de Desempenho - PROADES',$ui->GetImage('rh','diplomalegal_mini.png')    ,$module,'main:proades:find');
        //$panel->AddUserAction('rh_proadesadmin' ,A_EXECUTE,'CAMP/PROADES'                     ,$ui->GetImage('rh','diplomalegal_mini.png')    ,$module,'main:proades:campfind');
        //$panel->AddUserAction('rh_proadesadmin' ,A_EXECUTE,'CAMP/PROADES - 2 Fase'            ,$ui->GetImage('rh','diplomalegal_mini.png')    ,$module,'main:proades:campfind2');
        //$panel->AddUserAction('rh_proadesadmin' ,A_EXECUTE,'CAMP/PROADES - 3 Fase'            ,$ui->GetImage('rh','diplomalegal_mini.png')    ,$module,'main:proades:campfind3');
        //$panel->AddUserAction('rh_proadesadmin' ,A_EXECUTE,'Dados PROADES'                    ,$ui->GetImage('rh','diplomalegal_mini.png')    ,$module,'main:proades:dadosproades');
        //$panel->AddUserAction('consultaorg'     ,A_EXECUTE,'Setores'                          ,$ui->GetImage('rh','setores_mini.png')         ,$module,'main:consultaorg');
        $panel->AddUserAction('rh_funcao'       ,A_ACCESS ,'Funções de Confiança'             ,$ui->GetImage('rh','decisao_mini.png')         ,$module,'main:funcao:find');
//        $panel->AddUserAction('rh_funcao'       ,A_ACCESS ,'Tipos de Cargo de Confiança'      ,$ui->GetImage('rh','decisoes_mini.png')        ,$module,'main:cargoconfianca:find');
        $panel->AddUserAction('rh_saude'        ,A_EXECUTE,'Saúde'                            ,$ui->GetImage('rh','servidor_mini.png')        ,$module,'main:saude:find');  

        $theme->InsertContent($panel);
        // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
        /*
		$vinculo = $MIOLO->getBusiness('rh','vinculo');
        $login = $MIOLO->getLogin();
		$vinculo->getById($login->id);
        if ( $vinculo->isPersistent() )
        {
            if ( $vinculo->isTA() && $vinculo->isAtivo() )
            {
                $cmAtencao = new MPanel('pnlAtencao','Mensagem');
                $cmAtencao->AddControl(new MLabel("<b>ATENÇÃO:</b> inscrições do curso de Inglês: 09 e 10 de outubro de 2007. Os inscritos, com a anuência da chefia imediata, estão convidados a participar do SORTEIO DE VAGAS, dia 11 de outubro/07, às 16 horas, no Anfiteatro da Reitoria. As inscrições serão confirmadas pela PRORH somente após o sorteio das 35 vagas. Informações: 2102-3937.",'red',true));
            }
            $theme->InsertContent($cmAtencao);
        }
        */
    } 
?>
