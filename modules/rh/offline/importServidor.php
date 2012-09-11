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

ini_set("memory_limit","512M");//128M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

//único comando a trocar entre FRIO e QUENTE
//Nao esquecer de alterar os caminhos quando "commitar".
//$path = "/home/jefferson/miolo/";
$path = "/usr/local/siga2/";

//Diretório usado para armazenar temporariamente o conteúdo do campo LOB
//em forma de arquivo texto que será usado como entrada do processamento. 
//Vai conter, também, o arquivo de LOG do processamento. 
$pathtosave = $path . "modules/rh/files/integracaosiape/importacao/";

//$path = "/home/kimbow/miolo/"; 

//Inicializa o framework MIOLO
chdir("{$path}classes");
require_once "{$path}classes/miolo.class"; 
require_once "{$path}classes/support.inc";

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

echo date("d/m/Y H:i:s") . " Inicio do processamento importServidor" . "\n\n";

//Armazena o idArquivo recebido como parâmetro de entrada da linha de comando 
$idArquivo = $argv[1];

//Instancia o objeto que vai manipular a leitura e gravação dos dados na base 
$arquivoTabela = $MIOLO->getBusiness('common','arquivo');            
$arquivoTabela = $arquivoTabela->GetById($idArquivo);

//Cria um arquivo que vai receber o conteudo previamente armazenado no campo "conteudo " (LOB)
//do objeto que vai manipular a leitura e gravação dos dados na base. O conteudo é, normalmente,
//um arquivo compactado. Em seguida, extrai o conteúdo do campo LOB e grava o mesmo no arquivo criado.
$fConteudo = fopen($pathtosave . $arquivoTabela->nome,'w');	
fwrite($fConteudo,$arquivoTabela->conteudo);
fclose($fConteudo);

//Descompacta o arquivo gravado no passo anterior.
exec("gzip -d " . $pathtosave . $arquivoTabela->nome);

$fileNameTxt = $pathtosave . basename($arquivoTabela->nome,'.gz');

//Instancia o objeto que vai conter os dados obtidos após o processamento do arquivo 
//descompactado no passo anterior. 
$obj0 = $MIOLO->GetBusiness('rh','tipo0');
$obj0->BeginTransaction();

TRY
{    
	Varre($fileNameTxt);
    $obj0->EndTransaction();
    echo "\n \n \n" . date("d/m/Y H:i:s") . " Término do processamento do arquivo \n\n";
    
    //Apaga os arquivos temporários para não acumular no diretório de trabalho
    try
	{
		unlink($pathtosave . basename($arquivoTabela->nome));
		unlink($pathtosave . basename($arquivoTabela->nome,'.gz'));
	}
	catch (Exception $e) 
	{
		$this->erro[] = $e->getMessage();
	}
}
CATCH (Exception $e)
{
    echo "\n \n Informe o seguinte erro a equipe do CGCO: " . $e->getMessage() . "\n";
}

function Varre($fileNameTxt)
{    
	global $obj0;

    $quant = 0;
    $arrRegistros = file(trim($fileNameTxt));
    $count = count($arrRegistros);
    
    echo "\n fileNameTxt          [" . $fileNameTxt          . "] \n";

    for ( $i = 0; $i < $count; $i++ )
    {
        $registro = str_replace("\\", "/", $arrRegistros[$i]);
        $tipoRegistro = substr($registro,17,1);
        switch ($tipoRegistro)
        {
            case '0':
                Tipo_0($registro);
                break;
            case '1':
                Tipo_1($registro, $obj0->getTransaction(), $obj0->anomes);  //dados Pessoais do Servidor
                Pessoa($registro, $obj0->getTransaction());
                $quant ++;
                break;
            case '2':
                Tipo_2($registro, $obj0->getTransaction(), $obj0->anomes);  //dados Funcionais do Servidor
                break;
            case '3':
                Tipo_3($registro, $obj0->getTransaction(), $obj0->anomes);  //dados Financeiros do Servidor
                break;
            case '4':
                Tipo_4($registro, $obj0->getTransaction(), $obj0->anomes);  //totalização dos dados Financeiros do Servidor
                break;
            case '9':               //está tudo zero: quantidade de UPAG e de Servidores
                break;
            default:
                echo "\n Tipo de registro não previsto!\n" ;
                break;
        } // switch
    } // for
    $obj0->quant = $quant;
    $obj0->save();    
  
} // Varre


function Pessoa($registro, $transaction)
{
    global $MIOLO;

    $siape = substr($registro,9,7);
    $vinculo = $MIOLO->GetBusiness('rh','vinculo');

    $vinculo->GetById($siape);
    if ($vinculo->isPersistent())
    {
        $vinculo->retrieveAssociation('funcionario');
        $vinculo->setTransaction($transaction);

        $municipio = $MIOLO->GetBusiness('common','municipio');
        $municipio->getIdByNomeEstado( NormalizarEndereco(substr($registro,293,30)), substr($registro,331, 2) );

        if ($municipio->idMunicipio)
        {
            $vinculo->funcionario->pessoa->setTransaction($transaction);
            $vinculo->funcionario->pessoa->idmunicipio = $municipio->idMunicipio;

            $endereco    = NormalizarEndereco(substr($registro,201,40));
            $numero      = NormalizarEndereco(substr($registro,241, 6));
            $complemento = NormalizarEndereco(substr($registro,247,21));
            //$separadordecomplemento = ', ';
            if ($numero)
            {
                $endereco = $endereco . ', ' . $numero;
                //$separadordecomplemento = '/';
            }
            if ($complemento)
            {
                //$endereco = $endereco . $separadordecomplemento . $complemento;
                $endereco = $endereco . $complemento;
            }
            $vinculo->funcionario->pessoa->endereco = $endereco;
            $vinculo->funcionario->pessoa->bairro   = NormalizarEndereco(substr($registro,268,25));
            $vinculo->funcionario->pessoa->cep      = NormalizarEndereco(substr($registro,323, 8));
            //$vinculo->funcionario->idpais = '024' se '000'

            $vinculo->funcionario->pessoa->save();
        }
        else
        {
            //TVZ GRAVFAR EM tipo1->erro um código de erro
            //tambem há o caso de sevidor nao existente no SIGA
            if ( substr($registro,293,30) . '-' . substr($registro,331, 2) )
            {
                echo " <BR><font color=green> [" . $siape . "] <font color=black><BR>";
                echo '[' . substr($registro,293,30) . '-' . substr($registro,331, 2) . '] ' . substr($registro, 20,60) . '<BR>';
            }
        }
    }
} // Pessoa


function Tipo_0($registro)
{
    global $obj0;

    $MES_REFERENCIA = substr($registro,45,2);
    $ANO_REFERENCIA = substr($registro,47,4);
    echo "\n Mês de referência: " . $MES_REFERENCIA . '/' . $ANO_REFERENCIA . "\n"  ;
    $anomes = $ANO_REFERENCIA . $MES_REFERENCIA;
    if ( $obj0->getById($anomes) )
    {
        echo "\n Erro: mês já gravado" . "\n"  ;
        die;
    }
    $obj0->anomes = $anomes;
} // Tipo_0


function Tipo_1($registro, $transaction, $anomes)
{
    global $MIOLO;
    $obj1 = $MIOLO->GetBusiness('rh','tipo1');
    $obj1->setTransaction($transaction);

    $obj1->unid_pagadora   = substr($registro,  0, 9);
    $obj1->siape           = substr($registro,  9, 7);
    $obj1->dv_matricula    = substr($registro, 16, 1);
    $obj1->tipo_registro   = substr($registro, 17, 1);
    $obj1->sigla_uf        = substr($registro, 18, 2);
    $obj1->nome_servidor   = strtoupper(trim(substr($registro, 20,60)));
    $obj1->cpf             = substr($registro, 80,11);
    $obj1->pis_pasep       = substr($registro, 91,11);
    $obj1->nome_mae        = substr($registro,102,50);
    $obj1->sexo            = substr($registro,152, 1);
    $obj1->dt_nascimento   = substr($registro,153, 8);
    $obj1->estado_civil    = substr($registro,161, 1);
    $obj1->escolaridade    = substr($registro,162, 2);
    $obj1->titulacao       = substr($registro,164, 2);
    $obj1->filler1         = substr($registro,166, 5);
    $obj1->nacionalidade   = substr($registro,171, 1);
    $obj1->naturalidade    = substr($registro,172, 2);
    $obj1->pais            = substr($registro,174, 3);
    $obj1->ano_chegada     = substr($registro,177, 4);
    $obj1->quant_dep_ir    = substr($registro,181, 2);
    $obj1->quant_dep_sf    = substr($registro,183, 2);
    $obj1->dt_prim_emp     = substr($registro,185, 8);
    $obj1->identif_origem  = substr($registro,193, 8);
    $obj1->end_logradouro  = NormalizarEndereco(substr($registro,201,40));
    $obj1->end_numero      = NormalizarEndereco(substr($registro,241, 6));
    $obj1->end_complemento = NormalizarEndereco(substr($registro,247,21));
    $obj1->end_bairro      = NormalizarEndereco(substr($registro,268,25));
    $obj1->end_municipio   = NormalizarEndereco(substr($registro,293,30));
    $obj1->end_cep         = NormalizarEndereco(substr($registro,323, 8));
    $obj1->end_uf          = NormalizarEndereco(substr($registro,331, 2));
    $obj1->rg_numero       = substr($registro,333,14);
    $obj1->rg_orgao        = substr($registro,347, 5);
    $obj1->rg_dt_emissao   = substr($registro,352, 8);
    $obj1->rg_uf           = substr($registro,360, 2);
    $obj1->tit_eleitor     = substr($registro,362,13);

    $obj1->anomes = $anomes;
    $obj1->save();
} // Tipo_1


function Tipo_2($registro, $transaction, $anomes)
{
    global $MIOLO;
    $obj2 = $MIOLO->GetBusiness('rh','tipo2');
    $obj2->setTransaction($transaction);

    $obj2->unid_pagadora   = substr($registro,  0, 9);
    $obj2->siape           = substr($registro,  9, 7);
    $obj2->dv_matricula    = substr($registro, 16, 1);
    $obj2->tipo_registro   = substr($registro, 17, 1);
    $obj2->sigla_uf        = substr($registro, 18, 2);
    $obj2->regime_juridico = substr($registro, 20, 3);
    $obj2->cod_situacao    = substr($registro, 23, 2);
    $obj2->cart_trab_num   = substr($registro, 25, 6);
    $obj2->cart_trab_serie = substr($registro, 31, 5);
    $obj2->cart_trab_uf    = substr($registro, 36, 2);
    $obj2->banco           = substr($registro, 38, 3);
    $obj2->agencia         = substr($registro, 41, 6);
    $obj2->conta           = substr($registro, 47,13);
    $obj2->fgts_dt_opcao   = substr($registro, 60, 8);
    $obj2->fgts_banco      = substr($registro, 68, 3);
    $obj2->fgts_agencia    = substr($registro, 71, 6);
    $obj2->fgts_conta      = substr($registro, 77,13);
    $obj2->jornada_trab    = substr($registro, 90, 2);
    $obj2->perc_tempo_serv = substr($registro, 92, 2);
    $obj2->dt_cadast_serv  = substr($registro, 94, 8);
    $obj2->ind_supr_pagto  = substr($registro,102, 1);
    $obj2->dt_supr_pagto   = substr($registro,103, 6);
    $obj2->proporc_numerad = substr($registro,109, 2);
    $obj2->proporc_denomin = substr($registro,111, 2);
    $obj2->cargo_grupo     = substr($registro,113, 3);
    $obj2->cargo_nome      = substr($registro,116, 3);
    $obj2->cargo_classe    = substr($registro,119, 1);
    $obj2->cargo_ref_nivel = substr($registro,120, 3);
    $obj2->cargo_dt_entrad = substr($registro,123, 8);
    $obj2->cargo_dt_saida  = substr($registro,131, 8);
    $obj2->funcao_sigla    = substr($registro,139, 3);
    $obj2->funcao_codnivel = substr($registro,142, 5);
    $obj2->funcao_escolar  = substr($registro,147, 2);
    $obj2->funcao_opcao    = substr($registro,149, 1);
    $obj2->funcao_dt_ingr  = substr($registro,150, 8);
    $obj2->funcao_dt_saida = substr($registro,158, 8);
    $obj2->funcao_unid_org = substr($registro,166, 9);
    $obj2->nov_fc_sigla    = substr($registro,175, 3);
    $obj2->nov_fc_codnivel = substr($registro,178, 5);
    $obj2->nov_fc_escolar  = substr($registro,183, 2);
    $obj2->nov_fc_opcao    = substr($registro,185, 1);
    $obj2->nov_fc_dt_ingr  = substr($registro,186, 8);
    $obj2->nov_fc_dt_saida = substr($registro,194, 8);
    $obj2->nov_fc_unid_org = substr($registro,202, 9);
    $obj2->ativid_funcao   = substr($registro,211, 4);
    $obj2->lotac_unid_org  = substr($registro,215, 9);
    $obj2->lotac_unid_dt   = substr($registro,224, 8);
    $obj2->local_orgao     = substr($registro,232, 5);
    $obj2->local_unid_org  = substr($registro,237, 9);
    $obj2->ing_org_grupo   = substr($registro,246, 2);
    $obj2->ing_org_ocor    = substr($registro,248, 3);
    $obj2->ing_org_dt      = substr($registro,251, 8);
    $obj2->ing_org_dip_cod = substr($registro,259, 2);
    $obj2->ing_org_dip_num = substr($registro,261, 9);
    $obj2->ing_org_dip_dt  = substr($registro,270, 8);
    $obj2->ing_sp_grupo    = substr($registro,278, 2);
    $obj2->ing_sp_ocor     = substr($registro,280, 3);
    $obj2->ing_sp_dt       = substr($registro,283, 8);
    $obj2->ing_sp_dip_cod  = substr($registro,291, 2);
    $obj2->ing_sp_dip_num  = substr($registro,293, 9);
    $obj2->ing_sp_dip_dt   = substr($registro,302, 8);
    $obj2->exclus_grupo    = substr($registro,310, 2);
    $obj2->exclus_ocor     = substr($registro,312, 3);
    $obj2->exclus_dt       = substr($registro,315, 8);
    $obj2->exclus_dip_cod  = substr($registro,323, 2);
    $obj2->exclus_dip_num  = substr($registro,325, 9);
    $obj2->exclus_dip_dt   = substr($registro,334, 8);
    $obj2->afast_grupo     = substr($registro,342, 2);
    $obj2->afast_ocor      = substr($registro,344, 3);
    $obj2->afast_dt_inic   = substr($registro,347, 8);
    $obj2->afast_dt_term   = substr($registro,355, 8);
    $obj2->afast_dip_cod   = substr($registro,363, 2);
    $obj2->afast_dip_num   = substr($registro,365, 9);
    $obj2->afast_dip_dt    = substr($registro,374, 8);
    $obj2->inativ_grupo    = substr($registro,382, 2);
    $obj2->inativ_ocor     = substr($registro,384, 3);
    $obj2->inativ_dt       = substr($registro,387, 8);
    $obj2->inativ_dip_cod  = substr($registro,395, 2);
    $obj2->inativ_dip_num  = substr($registro,397, 9);
    $obj2->inativ_dip_dt   = substr($registro,406, 8);
    $obj2->apos_num_proc   = substr($registro,414,15);
    $obj2->apos_ano_prev   = substr($registro,429, 4);
    $obj2->apos_opcao_int  = substr($registro,433, 1);
    $obj2->uorg_controle   = substr($registro,434, 9);
    $obj2->mod_fun_grupo   = substr($registro,443, 2);
    $obj2->mod_fun_ocor    = substr($registro,445, 3);
    $obj2->mod_fun_dt      = substr($registro,448, 8);
    $obj2->mod_fun_dip_cod = substr($registro,456, 2);
    $obj2->mod_fun_dip_num = substr($registro,458, 9);
    $obj2->mod_fun_dip_dt  = substr($registro,467, 8);
    $obj2->reg_jur_ant     = substr($registro,475, 3);
    $obj2->sit_serv_ant    = substr($registro,478, 2);
    $obj2->mud_org_destino = substr($registro,480, 5);
    $obj2->mud_org_dt_lib  = substr($registro,485, 8);
    $obj2->mud_org_origem  = substr($registro,493, 5);
    $obj2->orgao_anterior  = substr($registro,498, 5);
    $obj2->matric_anterior = substr($registro,503, 7);
    $obj2->cod_org_extinto = substr($registro,510, 5);
    $obj2->mat_serv_extint = substr($registro,515, 7);
    $obj2->orgao_atual     = substr($registro,522, 5);
    $obj2->matric_atual    = substr($registro,527, 7);
    $obj2->mud_upag_codigo = substr($registro,534, 9);
    $obj2->mud_upag_dt_lib = substr($registro,543, 8);
    $obj2->mud_upag_motivo = substr($registro,551, 1);
    $obj2->indic_pag_serv  = substr($registro,552, 1);
    $obj2->obito_cartori0  = substr($registro,553,50);
    $obj2->obito_livro     = substr($registro,603, 8);
    $obj2->obito_folha     = substr($registro,611, 6);
    $obj2->obito_registro  = substr($registro,617, 8);
    $obj2->obito_dt        = substr($registro,625, 8);
    $obj2->ind_exc_instit  = substr($registro,633, 1);
    $obj2->dt_exc_instit   = substr($registro,634, 8);
    $obj2->vale_al_tipo    = substr($registro,642, 1);
    $obj2->vale_al_dt_inic = substr($registro,643, 8);
    $obj2->vale_al_dt_fim  = substr($registro,651, 8);
    $obj2->ind_oper_raiox  = substr($registro,659, 1);
    $obj2->orgao_requisit  = substr($registro,660, 5);
    $obj2->codigo_vaga     = substr($registro,665, 7);
    $obj2->mes_anuenio     = substr($registro,672, 2);
    $obj2->perc_oper_raiox = substr($registro,674, 5);
    $obj2->posse_grupo     = substr($registro,679, 2);
    $obj2->posse_ocor      = substr($registro,681, 3);
    $obj2->posse_dt        = substr($registro,684, 8);
    $obj2->posse_dip_cod   = substr($registro,692, 2);
    $obj2->posse_dip_dt    = substr($registro,694, 8);
    $obj2->posse_dip_num   = substr($registro,702, 9);
    $obj2->rev_ati_grupo   = substr($registro,711, 2);
    $obj2->rev_ati_ocor    = substr($registro,713, 3);
    $obj2->rev_ati_dt      = substr($registro,716, 8);
    $obj2->rev_ati_dip_cod = substr($registro,724, 2);
    $obj2->rev_ati_dip_dt  = substr($registro,726, 8);
    $obj2->rev_ati_dip_num = substr($registro,734, 9);
    $obj2->ica_cargo       = substr($registro,743, 1);
    $obj2->ica_funcao      = substr($registro,744, 1);
    $obj2->ica_sal_familia = substr($registro,745, 1);
    $obj2->ica_adic_tempo  = substr($registro,746, 1);
    $obj2->ica_fgts        = substr($registro,747, 1);
    $obj2->ica_inss        = substr($registro,748, 1);
    $obj2->ica_ir          = substr($registro,749, 1);
    $obj2->ica_margem_cons = substr($registro,750, 1);
    $obj2->ica_cont_sind   = substr($registro,751, 1);
    $obj2->ica_adiant_13   = substr($registro,752, 1);
    $obj2->ica_abate_teto  = substr($registro,753, 1);
    $obj2->ica_13_salario  = substr($registro,754, 1);
    $obj2->ica_pss_6       = substr($registro,755, 1);
    $obj2->ica_ferias      = substr($registro,756, 1);
    $obj2->ica_pensao      = substr($registro,757, 1);
    $obj2->ica_beneficios  = substr($registro,758, 1);
    $obj2->ica_ipmf_cpmf   = substr($registro,759, 1);
    $obj2->ica_rais        = substr($registro,760, 1);
    $obj2->ica_dif_urv     = substr($registro,761, 1);
    $obj2->ica_adiant      = substr($registro,762, 1);
    $obj2->ica_rend_pasep  = substr($registro,763, 1);
                                              
    $obj2->anomes = $anomes;
    $obj2->save();
} // Tipo_2


function Tipo_3($registro, $transaction, $anomes)
{
    global $MIOLO;
    $obj3 = $MIOLO->GetBusiness('rh','tipo3');
    $obj3->setTransaction($transaction);

    $obj3->unid_pagadora  = substr($registro,  0, 9);
    $obj3->siape          = substr($registro,  9, 7);
    $obj3->dv_matricula   = substr($registro, 16, 1);
    $obj3->tipo_registro  = substr($registro, 17, 1);
    $obj3->sigla_uf       = substr($registro, 18, 2);
    $obj3->rub_rend_desc  = substr($registro, 20, 1);
    $obj3->rub_codigo     = substr($registro, 21, 5);
    $obj3->rub_sequencia  = substr($registro, 26, 1);
    $obj3->rub_valor      = substr($registro, 27,11);
    $obj3->rub_prazo      = substr($registro, 38, 3);
    $obj3->param_percent  = substr($registro, 41, 5);
    $obj3->param_frac_num = substr($registro, 46, 3);
    $obj3->param_frac_den = substr($registro, 49, 3);
    $obj3->param_assunto  = substr($registro, 52, 2);
    $obj3->param_niv_scn  = substr($registro, 54, 1);
    $obj3->param_niv_cemp = substr($registro, 55,12);
    $obj3->benef_nome     = substr($registro, 67,40);
    $obj3->benef_banco    = substr($registro,107, 3);
    $obj3->benef_agencia  = substr($registro,110, 6);
    $obj3->benef_conta    = substr($registro,116,13);
    $obj3->benef_anomes   = substr($registro,129, 6);

    $obj3->anomes = $anomes;
    $obj3->save();
} // Tipo_3


function Tipo_4($registro, $transaction, $anomes)
{
    global $MIOLO;
    $obj4 = $MIOLO->GetBusiness('rh','tipo4');
    $obj4->setTransaction($transaction);
    $obj4->unid_pagadora   = substr($registro, 0, 9);
    $obj4->siape           = substr($registro, 9, 7);
    $obj4->dv_matricula    = substr($registro,16, 1);
    $obj4->tipo_registro   = substr($registro,17, 1);
    $obj4->sigla_uf        = substr($registro,18, 2);
    $obj4->total_bruto     = substr($registro,20,12);
    $obj4->total_descontos = substr($registro,32,12);
    $obj4->liquido         = substr($registro,44,12);
    $obj4->total_reg_3     = substr($registro,56, 3);

    $obj4->anomes = $anomes;
    $obj4->save();
} // Tipo_4


function NormalizarEndereco($texto)
{
		$texto = strtolower(trim($texto));

		$texto = str_replace(".", "",$texto);

		$texto = str_replace("--", " ",$texto);
		$texto = str_replace("--", " ",$texto);
		$texto = str_replace("-", " ",$texto);

		$texto = str_replace("__", " ",$texto);
		$texto = str_replace("__", " ",$texto);
		$texto = str_replace("_", " ",$texto);

		$texto = str_replace("  ", " ",$texto);
		$texto = str_replace("  ", " ",$texto);
		$texto = str_replace("  ", " ",$texto);
		$texto = str_replace("  ", " ",$texto);

		$texto = str_replace(" , ", ",",$texto);
		$texto = str_replace(", ", ",",$texto);
		$texto = str_replace(" ,", ",",$texto);

		$texto = str_replace(" apto ", "/",$texto);
		$texto = str_replace(" apt ", "/",$texto);
		$texto = str_replace(" ap ", "/",$texto);

		$texto = str_replace(" apto", "/",$texto);
		$texto = str_replace(" apt", "/",$texto);
		$texto = str_replace(" ap", "/",$texto);

		$texto = str_replace("apto ", "/",$texto);
		$texto = str_replace("apt ", "/",$texto);
		$texto = str_replace("ap ", "/",$texto);

		$texto = str_replace(" / ", "/",$texto);
		$texto = str_replace("/ ", "/",$texto);
		$texto = str_replace(" /", "/",$texto);

		
		$texto = str_replace("bloco", "bl",$texto);
		$texto = str_replace("caixa postal", "cp",$texto);
		$texto = str_replace("apartamento", "/",$texto);
		//$texto = str_replace("","",$texto);
		//$texto = str_replace("","",$texto);

		// tirar acentos e sinais gráficos
		$texto = ereg_replace("[#áàâãªÓó]", "a",$texto);		   
		$texto = ereg_replace("[¿éèê]", "e",$texto);
		$texto = ereg_replace("[±òôõº]", "o",$texto);	
		$texto = ereg_replace("[úùû]", "u",$texto);
		$texto = ereg_replace("[\"]", "i",$texto);
		$texto = ereg_replace("[ç]", "c",$texto);

		$texto = strtoupper($texto);

		return $texto;
}


/*____________________________________________________________________________________________________________________________________
|                                                                                                                                     |
| Seqüência normal:                                                                                                                   |
|                                                                                                                                     |
| 1) url: siga1.ufjf.br                                                                                                               |
|    menu Integração SIAPE :: Importação :: Servidores  (frio: frmServidores.class)                                                   |
|      .busca o texto do computador local, AAAA_MM.txt ou AAAA_MM.zip (este melhor devido ao limite de tamanho para transmissão)      |
|      .envia o texto para /home/USUARIO/miolo/modules/rh/files/integracaosiape/importacao/servidores/siapefitaesp_MM_AAAA.txt.gz     |
|                             /usr/local/siga2/modules/rh/files/integracaosiape/importacao/servidores/siapefitaesp_MM_AAAA.txt.gz     |
|                                                                                                                                     |
| 2) alterar miolo.conf: <level>0</level>                                                                                             |
|                                                                                                                                     |
| 3.1) crontab: php5 -f processaArquivos.php                                                                                          |
|                                                                                                                                     |
| 4) Integração SIAPE :: Importação :: Consistência e Importação (relatório comparando Espelho e SIGA)                                |
|_____________________________________________________________________________________________________________________________________|
|                                                                                                                                     |
| alternativa 3.2) putty:                                                                                                             |
|   .cd  /home/USUARIO/miolo/modules/rh/offline                                                                                       |
|   .php5 -f importServidor.php /home/USUARIO/miolo/modules/rh/files/integracaosiape/importacao/servidores/siapefitaesp_MM_AAAA.txt.gz|
|                                                                                                                                     |
| alternativa 3.3)                                                                                                                    |
|   .copiar importServidor.php para F:\miolo\html                                                                                     |
|   .http://miolo.ufjf.br:8540/importServidor.php  mas colocando $fileNameTxt = '/home/batista/miolo/html/2008_12.txt';               |
|____________________________________________________________________________________________________________________________________*/


/*
observe-se que caracteres '\' são trocados por '/'
*/


?>
