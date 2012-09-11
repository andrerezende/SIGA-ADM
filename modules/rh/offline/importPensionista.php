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

ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");
//error_reporting(0);

//Nao esquecer de alterar os caminhos quando for "commitar".
//$path = "/home/kimbow/public_html/miolo/";
//$path = "/home/jefferson/miolo/";
$path = "/usr/local/siga2/";

//Diretório usado para armazenar temporariamente o conteúdo do campo LOB
//em forma de arquivo texto que será usado como entrada do processamento. 
//Vai conter, também, o arquivo de LOG do processamento. 
$pathtosave = $path . "modules/rh/files/integracaosiape/importacao/";

chdir("{$path}classes");
include_once "{$path}classes/miolo.class";
include_once "{$path}classes/support.inc";

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

//chdir($MIOLO->getConf('home.modules').'/rh/offline');
//$filename = $argv[1].$argv[2];

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

$arrRegistros = file(trim($fileNameTxt));

exec("gzip -f9 ".$fileNameTxt); //??? Substituir isso por UNLINK ???

echo(date("d/m/Y H:i:s")." - INICIO DO PROCESSAMENTO DE importPensionista.php."."\n");
$representacaoPensao = $MIOLO->GetBusiness('rh','representacaopensao');
$pensionista 		 = $MIOLO->GetBusiness('rh','pensionista');
$pessoa 	 		 = $MIOLO->GetBusiness('common','pessoa');
$municipio 	 		 = $MIOLO->GetBusiness('common','municipio');
$countTemp = 0;
$countPensionistas = 0;
for ($i = 1; $i < (count($arrRegistros)); $i++ ) //-7971 10%
{
	$registro = $arrRegistros[$i];
	$tipoRegistro = intval(substr($registro,24,1));
	$MATRICULA_PENSIONISTA = substr($registro,16,8);  //intval
	$MATRICULA_INSTITUIDOR = substr($registro,9,7);

	limparPensionista($pensionista);
	limparPessoa($pessoa);
	limparRepresentacaoPensao($representacaoPensao);

	$pessoa->setPersistent(false);
	$pensionista->setPersistent(false);
	$representacaoPensao->setPersistent(false);

	switch ($tipoRegistro)
	{

		case 1:
		/*
		   Não é preciso processar os registro de tipo 1 pois, até o momento
		   não existem informações que precisam ser importadas.
		*/
/*
			$pensionista->GetById($MATRICULA_PENSIONISTA);
			if ( !$pensionista->IsPersistent() )
			{
				$pensionista->idPensionista = $MATRICULA_PENSIONISTA;
			}

			$dataExclusao = substr($registro,98,2)."/".substr($registro,100,2)."/".substr($registro,102,4);
			if ( $dataExclusao != "00/00/0000" )
			{
				$pensionista->dataExclusao = $dataExclusao;
			}

			$pensionista->idVinculo = $MATRICULA_INSTITUIDOR;

			$pensionista->idPessoa = ?;

			$pensionista->Save();
*/
		break;

		case 2:
/*
			$pensionista->GetById($MATRICULA_PENSIONISTA);
			if ( !$pensionista->IsPersistent() )
			{
				$pensionista->idPensionista = $MATRICULA_PENSIONISTA;
			}
			$pensionista->numLeiPensao = substr($registro,27,5);

			$dataLeiPensao = substr($registro,32,2)."/".substr($registro,34,2)."/".substr($registro,36,8);
			if ( $dataLeiPensao != "00/00/0000" )
			{
				$pensionista->dataLeiPensao = $dataLeiPensao;
			}

			$dataPubLeiPensao = substr($registro,40,2)."/".substr($registro,42,2)."/".substr($registro,44,4);
			if ( $dataPubLeiPensao != "00/00/0000" )
			{
				$pensionista->dataPubLeiPensao = $dataPubLeiPensao;
			}
			$pensionista->numProcPensao = substr($registro,48,15);

			$dataExclusao = substr($registro,63,2)."/".substr($registro,65,2)."/".substr($registro,67,4);
			if ( $dataExclusao != "00/00/0000" )
			{
				$pensionista->dataExclusao = $dataExclusao;
			}

			$pensionista->idPessoa = ?;

			$pensionista->Save();
*/
		break;

		// DADOS CADASTRAIS PESSOAIS DO PENSIONISTA
		case 3:

			$pessoa->cpf 	  = substr($registro,80,11);
			$pessoa->nome 	  = trim(substr($registro,27,45)); // NOT NULL
			$dataNasc		  = substr($registro,72,2)."/".substr($registro,74,2)."/".substr($registro,76,4); // NOT NULL

			echo($i.")\t Tipo: ".$tipoRegistro."\t".date(" H:i:s")."\t ".++$countTemp."\t ".++$countPensionistas."\t"."$pessoa->cpf - $pessoa->nome - $dataNasc"."\n");

			if ( $dataNasc != "00/00/0000" )
			{
				$pessoa->datanasc = $dataNasc;
			}
			else
			{
			    echo("Esta pessoa possui data de nascimento: (00/00/0000). Foi gravado '01/01/5000' no banco de dados.\n");
				$pessoa->datanasc = "01/01/5000";
			}


			if ( intval($pessoa->cpf) > 0 )
			{
				if ( $pessoa->GetByCpf($pessoa->cpf) != null ) // ou NULL ou objPessoa
				{
					$pessoa = $pessoa->GetByCpf($pessoa->cpf);
					$pessoa->setPersistent(true);
				}
				else
				{
					if ( $pessoa->GetByNomeDataNasc($pessoa->nome,$pessoa->datanasc) != null )
					{
						$pessoa = $pessoa->GetByNomeDataNasc($pessoa->nome,$pessoa->datanasc);
						$pessoa->setPersistent(true);
					}
				}

				$pessoa->cpf 			= substr($registro,80,11);
				$pessoa->nome 			= trim(substr($registro,27,45)); // NOT NULL
				$dataNasc				= substr($registro,72,2)."/".substr($registro,74,2)."/".substr($registro,76,4); // NOT NULL
				$pessoa->sexo 			= substr($registro,91,1); // NOT NULL
				$pessoa->idestadocivil 	= substr($registro,92,1);
				$pessoa->numrg 			= substr($registro,95,14);
				$pessoa->orgaorg 		= substr($registro,109,5);

				$dataRG = substr($registro,114,2)."/".substr($registro,116,2)."/".substr($registro,118,4);
				if ( $dataRG != "00/00/0000" ) // DATA INVÁLIDA PARA O ORACLE
				{
					$pessoa->datarg = $dataRG;
				}
				else
				{
				    echo "Esta pessoa possui data de expedição do RG em: '00/00/0000'. Foi gravado '' no banco de dados.\n";
					$pessoa->datarg = "";
				}

				$pessoa->ufrg 			= substr($registro,122,2);
				$pessoa->endereco 		= substr($registro,124,40);
				$pessoa->bairro 		= substr($registro,164,25);

				// ---------------------------------- TO DO: municípo por codigo não informado na fita espelho e obrigatório no siga
				// SOLUÇÃO: pegar o município referente ao estado da carteira de identidade (rg)
				$nomeMunicipio = trim(substr($registro,189,30));
				$municipio->GetIdByNomeEstado($nomeMunicipio,$pessoa->ufrg);
				$pessoa->idmunicipio 	= $municipio->idMunicipio; // NOT NULL

				$pessoa->cep 			= substr($registro,219,8); // NOT NULL
				$pessoa->telefone 		= substr($registro,227,12);
				$pessoa->tituloeleitor 	= substr($registro,239,13);
				$pessoa->nomemae 		= substr($registro,252,50);
				$pessoa->email 			= substr($registro,302,50);

				// ---------------------------------- TO DO: id pais nao informado na fita espelho e obrigatório no siga
				// SOLUÇÂO: colocar Brasil para todo mundo
				$pessoa->idpais			  = "024"; // NOT NULL
				$pessoa->idpaisnascimento = "024"; // NOT NULL

				if ( $pessoa->IsPersistent() )
				{
					$pessoa->dataultalt = date("d/m/Y");
				}
				$pessoa->Save();

				$pensionista->GetById($MATRICULA_PENSIONISTA);
				if ( !$pensionista->IsPersistent() )
				{
					$pensionista->idPensionista = $MATRICULA_PENSIONISTA;
				}

				$pensionista->idPessoa 		= $pessoa->idpessoa;
				$pensionista->idInstituidor = $MATRICULA_INSTITUIDOR;
				$pensionista->qtdDepIR 		= substr($registro,93,2);

				$pensionista->Save();

			}

		break;

		// DADOS CADASTRAIS DO BENEFÍCIO
		case 4:

			echo($i.")\t Tipo: ".$tipoRegistro."\t".date(" H:i:s")."\t ".++$countTemp."\n");

			// REPRESENTANTE LEGAL
			$pessoa->cpf = substr($registro,291,11);
			if ( intval($pessoa->cpf) > 0 )
			{

				if ( ( $pessoa->GetByCpf($pessoa->cpf) != null ) ) // ou NULL == false ou objPessoa
				{
				    // Recupera informações de uma pessoa do banco de dados, caso exista o CPF cadastrado
					$pessoa = $pessoa->GetByCpf($pessoa->cpf);
					$pessoa->setPersistent(true);
				}

				// Sobrescreve (atualiza) informações da pessoa, caso esteja no banco de dados
				$pessoa->endereco 	= substr($registro,147,40);
				$pessoa->bairro 	= substr($registro,187,25);
				$pessoa->municipio 	= substr($registro,212,30);
				$pessoa->cep		= substr($registro,242,8);
				$pessoa->telefone	= substr($registro,250,12);
				$pessoa->numrg		= substr($registro,262,14);
				$pessoa->orgaorg	= substr($registro,276,5);

                // Campos que são not null no banco de dados
			    echo("Instituidor: $MATRICULA_INSTITUIDOR - Pensionista: $MATRICULA_PENSIONISTA - Representante Legal com dados obrigatórios preenchidos automaticamente\n");
				$pessoa->idpais			  = "024"; // NOT NULL = BRASIL PARA TODOS
				$pessoa->idpaisnascimento = "024"; // NOT NULL = BRASIL PARA TODOS
				$pessoa->datanasc         = "01/01/5001";  // representante legal
				$pessoa->sexo             = "I"; // INDEFINIDO
				$pessoa->idmunicipio      = "4733"; // JUIZ DE FORA

				$dataRG = substr($registro,281,2)."/".substr($registro,283,2)."/".substr($registro,285,4);
				if ( $dataRG != "00/00/0000" ) // Data inválida para o Oracle
				{
					$pessoa->datarg	= $dataRG;
				}
				else
				{
					$pessoa->datarg = "";
				}

				$pessoa->ufrg = substr($registro,289,2);
				$pessoa->nome = substr($registro,382,45);

				if ( $pessoa->IsPersistent() )
				{
					$pessoa->dataultalt = date("d/m/Y");
				}
				$pessoa->Save();

				// Representacao da Pensao
				$dtInicioProcuracao = substr($registro,366,2)."/".substr($registro,368,2)."/".substr($registro,370,4);

				if (  $dtInicioProcuracao != "00/00/0000" ) // Data inválida para o Oracle
				{
					$representacaoPensao->dataInicio = $dtInicioProcuracao;

					$dtFimProcuracao = substr($registro,374,2)."/".substr($registro,376,2)."/".substr($registro,378,4);
					if (  $dtFimProcuracao != "00/00/0000" ) // Data inválida para o Oracle
					{
						$representacaoPensao->dataFim = $dtFimProcuracao;
					}
					else
					{
						$representacaoPensao->dataFim = "";
					}


					// ---------------------------------- TO DO: Verificar se já existe, para não repetir no banco de dados
					// se a representacao já existir, então pegá-la para atualização.
					$ret = $representacaoPensao->GetByIdPensionistaDatas($MATRICULA_PENSIONISTA,$dtInicioProcuracao,$dtFimProcuracao);

					if ( $ret->IsPersistent() )
					{
						$representacaoPensao = $ret;
					}
					$representacaoPensao->idPensionista = $MATRICULA_PENSIONISTA;

					$representacaoPensao->idPessoa 	 = $pessoa->idpessoa;

					// ---------------------------------- *TO DO: O id do vinculo fornecido pela fita espelho nao bate com o do siga.
 				    $representacaoPensao->idVinculo  = "";//$MATRICULA_INSTITUIDOR; //""; Matricula do Representante legal
				    //$representacaoPensao->idVinculo  = substr($registro,140,7);
					$representacaoPensao->cartorio 	 = substr($registro,302,50);
					$representacaoPensao->livro 	 = substr($registro,352,8);
					$representacaoPensao->folha 	 = substr($registro,360,6);

					$representacaoPensao->Save();
				}
			}


			// PENSIONISTAS
			$pensionista->GetById($MATRICULA_PENSIONISTA);
			if ( !$pensionista->IsPersistent() )
			{
				$pensionista->idPensionista = $MATRICULA_PENSIONISTA;
			}

			$pensionista->idPessoa 				= $pessoa->idpessoa;
			$pensionista->idVinculo 			= $MATRICULA_INSTITUIDOR;
			$pensionista->origemPensao 			= substr($registro,27,1);
			$pensionista->numProcPensionista 	= intval(substr($registro,28,15));
			$pensionista->parentesco			= substr($registro,43,2);
			$pensionista->UORGControle			= intval(substr($registro,45,9));
			$pensionista->UORGLocal				= intval(substr($registro,54,9));
			$pensionista->bancoPgto 			= intval(substr($registro,63,3));
			$pensionista->tipoContaPgto 		= substr($registro,72,2);
			$pensionista->agenciaPgto 			= intval(substr($registro,66,6));
			$pensionista->contaPgto 			= intval(substr($registro,74,13));
			$pensionista->identContaJudicial	= substr($registro,87,18);
			$pensionista->numBenefINSS			= intval(substr($registro,105,10));
			$pensionista->especieBenefINSS		= substr($registro,115,3);
			$pensionista->tipoPensao			= substr($registro,118,2);
			$pensionista->naturezaPensao		= substr($registro,120,1);
			$pensionista->percentPensao			= substr($registro,121,3);

			$dataIPensao = substr($registro,124,2)."/".substr($registro,126,2)."/".substr($registro,128,4);
			if ( $dataIPensao != "00/00/0000" ) // Data inválida para o Oracle
			{
				$pensionista->dataInicioPensao = $dataIPensao;
			}
			else
			{
				// *TO DO:  --------------------------------- Verificar o preenchimento da data - o siga não permite 00/00/0000 ou null!
				// Resolvido com ifs
				$pensionista->dataInicioPensao = "";
			}

			$dataFPensao = substr($registro,132,2)."/".substr($registro,134,2)."/".substr($registro,136,4);
			if ( $dataFPensao != "00/00/0000" ) // Data inválida para o Oracle
			{
				$pensionista->dataFimPensao	= $dataFPensao;
			}
			else
			{
				$pensionista->dataFimPensao = "";
			}

			$pensionista->idRepresentacao			= substr($registro,140,7);
			$pensionista->numeradorCotaParte		= intval(substr($registro,427,2));
			$pensionista->denominadorCotaParte		= intval(substr($registro,429,2));
			$pensionista->numeradorCotaComp			= intval(substr($registro,431,2));
			$pensionista->denominadorCotaComp		= intval(substr($registro,433,2));
			$pensionista->mesInicioPgto				= intval(substr($registro,435,2));
			$pensionista->anoInicioPgto				= substr($registro,437,4);
			$pensionista->mesSuspPgto				= intval(substr($registro,441,2));
			$pensionista->anoSuspPgto				= substr($registro,443,4);
			$pensionista->idGrupoOcorrenciaExclusao	= intval(substr($registro,447,2));
			$pensionista->idOcorrenciaExclusao		= intval(substr($registro,449,3));

			$dataExclusao = substr($registro,452,2)."/".substr($registro,454,2)."/".substr($registro,456,4);
			if ( $dataExclusao != "00/00/0000" ) // Data inválida para o Oracle
			{
				$pensionista->dataExclusao = $dataExclusao;
			}
			else
			{
				// --------------------------------- *TO DO: Verificar o preenchimento da data  - o siga não permite 00/00/0000 ou null!
				// Resolvido com ifs
				$pensionista->dataExclusao = "";
			}

			$pensionista->Save();

		break;

		case 5:
		break;

		case 6:
		break;

		case 7:
		break;

		case 8:
		break;

	    case 9:
	        echo "\nRegistro Final (Tipo 9)\n";
		break;

		default:
			echo "\nTipo de registro não previsto!\n";
		break;
	}

}
echo("\n".date("d/m/Y H:i:s")." - Término do processamento do arquivo $fileNameTxt");


function limparPessoa(&$pessoa)
{

	$pessoa->cpf 			  = "";
	$pessoa->nome 			  = "";
	$pessoa->datanasc 		  = "";
	$pessoa->sexo 			  = "";
	$pessoa->idestadocivil 	  = "";
	$pessoa->numrg 			  = "";
	$pessoa->orgaorg 		  = "";
	$pessoa->ufrg 			  = "";
	$pessoa->endereco 		  = "";
	$pessoa->bairro 		  = "";
	$pessoa->idmunicipio 	  = "";
	$pessoa->cep 			  = "";
	$pessoa->telefone 		  = "";
	$pessoa->tituloeleitor 	  = "";
	$pessoa->nomemae 		  = "";
	$pessoa->email 			  = "";
	$pessoa->idpais			  = "";
	$pessoa->idpaisnascimento = "";

}


function limparRepresentacaoPensao(&$representacaoPesnao)
{
	$representacaoPensao->dataInicio 	= "";
	$representacaoPensao->dataFim 	 	= "";
	$representacaoPensao->dataFim 	 	= "";
	$representacaoPensao->idPensionista = "";
	$representacaoPensao->idPessoa 	 	= "";
	$representacaoPensao->idVinculo  	= "";//substr($registro,140,7);
	$representacaoPensao->cartorio 	 	= "";
	$representacaoPensao->livro 	 	= "";
	$representacaoPensao->folha 	 	= "";
}


function limparPensionista(&$pensionista)
{
	$pensionista->idPessoa 					= "";
	$pensionista->idVinculo 				= "";
	$pensionista->origemPensao 				= "";
	$pensionista->numProcPensionista 		= "";
	$pensionista->parentesco				= "";
	$pensionista->UORGControle				= "";
	$pensionista->UORGLocal					= "";
	$pensionista->bancoPgto 				= "";
	$pensionista->tipoContaPgto 			= "";
	$pensionista->agenciaPgto 				= "";
	$pensionista->contaPgto 				= "";
	$pensionista->identContaJudicial		= "";
	$pensionista->numBenefINSS				= "";
	$pensionista->especieBenefINSS			= "";
	$pensionista->tipoPensao				= "";
	$pensionista->naturezaPensao			= "";
	$pensionista->percentPensao				= "";
	$pensionista->dataInicioPensao			= "";
	$pensionista->dataFimPensao				= "";
	$pensionista->idRepresentacao			= "";
	$pensionista->numeradorCotaParte		= "";
	$pensionista->denominadorCotaParte		= "";
	$pensionista->numeradorCotaComp			= "";
	$pensionista->denominadorCotaComp		= "";
	$pensionista->mesInicioPgto				= "";
	$pensionista->anoInicioPgto				= "";
	$pensionista->mesSuspPgto				= "";
	$pensionista->anoSuspPgto				= "";
	$pensionista->idGrupoOcorrenciaExclusao	= "";
	$pensionista->idOcorrenciaExclusao		= "";
	$pensionista->dataExclusao 				= "";
}
?>
