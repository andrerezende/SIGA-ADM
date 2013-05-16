<?php
require_once 'classes/Relatorio.php';

class RmbAnalitico extends Relatorio {

	public function getNomesInstituicoes($params = array()) {
		$nomesInstituicoes = $this->dataSource->execute("
			SELECT instituicao AS nome
			FROM cm_instituicao
			WHERE idinstituicao IN {$params['idsRef']}
			ORDER BY idinstituicao;"//AND aip.iditempatrimonio = aip_ant.iditempatrimonio
		);
		$instituicoes  = '';	
		foreach ($nomesInstituicoes as $instituicao) {
			$instituicoes .= substr($instituicao->nome, 10) . ',';
		}
		return ucwords(mb_strtolower(substr($instituicoes, 0, -1)));//{$params['mesAnoRef']} {$params['idsRef']}
	}

	public function geraRelatorio($params = array()) {
		return $this->dataSource->execute("
		SELECT aip.idvidautil, ad_vidautil.descricao, aip.iditempatrimonio,aip.descricao,nt.datanotafiscal,nt.notafiscal,nt.cnpj,
nt.dataateste,
		COALESCE((SELECT SUM(aip_ant.valor)
		FROM ad_itempatrimonio aip_ant
			INNER JOIN cm_setor ON aip_ant.idsetor = cm_setor.idsetor
			INNER JOIN cm_instituicao ON cm_setor.idinstituicao = cm_instituicao.idinstituicao
		WHERE aip_ant.dataaquisicao < CAST('{$params['mesAnoRef']}' as date)
			AND aip_ant.ativo = 'S'
			AND aip.idvidautil = aip_ant.idvidautil
                AND aip.iditempatrimonio = aip_ant.iditempatrimonio
			AND cm_instituicao.idinstituicao IN {$params['idsRef']}
		GROUP BY aip_ant.idvidautil), 0)
		+
		COALESCE((SELECT SUM(aip_sai.valor)
		FROM ad_itempatrimonio aip_sai
			LEFT JOIN ad_movimentopat mov_saida ON aip_sai.iditempatrimonio = mov_saida.iditempatrimonio
			INNER JOIN cm_setor ON aip_sai.idsetor = cm_setor.idsetor
			INNER JOIN cm_instituicao ON cm_setor.idinstituicao = cm_instituicao.idinstituicao
		WHERE mov_saida.data >= CAST('{$params['mesAnoRef']}' as date)
			AND mov_saida.data < (CAST('{$params['mesAnoRef']}' as date) + INTERVAL '1 month')
			AND mov_saida.motivobaixa IS NOT NULL
			AND aip_sai.dataaquisicao < CAST('{$params['mesAnoRef']}' as date)
			AND aip.idvidautil = aip_sai.idvidautil
                        AND aip.iditempatrimonio = aip_sai.iditempatrimonio
			AND cm_instituicao.idinstituicao IN {$params['idsRef']}
		GROUP BY aip_sai.idvidautil), 0) as saldo_anterior,
		COALESCE((SELECT SUM(aip_sai.valor)
		FROM ad_itempatrimonio aip_sai
			LEFT JOIN ad_movimentopat mov_saida ON aip_sai.iditempatrimonio = mov_saida.iditempatrimonio
			INNER JOIN cm_setor ON aip_sai.idsetor = cm_setor.idsetor
			INNER JOIN cm_instituicao ON cm_setor.idinstituicao = cm_instituicao.idinstituicao
		WHERE mov_saida.data >= CAST('{$params['mesAnoRef']}' as date)
			AND mov_saida.data < (CAST('{$params['mesAnoRef']}' as date) + INTERVAL '1 month')
			AND mov_saida.motivobaixa IS NOT NULL
			AND aip.idvidautil = aip_sai.idvidautil
                        AND aip.iditempatrimonio = aip_sai.iditempatrimonio
			AND cm_instituicao.idinstituicao IN {$params['idsRef']}
		GROUP BY aip_sai.idvidautil), 0) as saida,
		COALESCE((SELECT SUM(aip_sai.valor)
		FROM ad_itempatrimonio aip_sai
			LEFT JOIN ad_movimentopat mov_saida ON aip_sai.iditempatrimonio = mov_saida.iditempatrimonio
			INNER JOIN cm_setor ON aip_sai.idsetor = cm_setor.idsetor
		INNER JOIN cm_instituicao ON cm_setor.idinstituicao = cm_instituicao.idinstituicao
		WHERE mov_saida.data >= CAST('{$params['mesAnoRef']}' as date)
			AND mov_saida.data < (CAST('{$params['mesAnoRef']}' as date) + INTERVAL '1 month')
			AND mov_saida.motivobaixa IS NOT NULL
			AND aip_sai.dataaquisicao >= CAST('{$params['mesAnoRef']}' as date)
			AND aip_sai.dataaquisicao < (CAST('{$params['mesAnoRef']}' as date) + INTERVAL '1 month')
			AND aip.idvidautil = aip_sai.idvidautil
                        AND aip.iditempatrimonio = aip_sai.iditempatrimonio
			AND cm_instituicao.idinstituicao IN {$params['idsRef']}
		GROUP BY aip_sai.idvidautil), 0)
		+
		COALESCE((SELECT SUM(aip_ent.valor)
		FROM ad_itempatrimonio aip_ent
			INNER JOIN cm_setor ON aip_ent.idsetor = cm_setor.idsetor
			INNER JOIN cm_instituicao ON cm_setor.idinstituicao = cm_instituicao.idinstituicao
		WHERE    aip_ent.dataaquisicao >= CAST('{$params['mesAnoRef']}' as date)
			AND aip_ent.dataaquisicao < (CAST('{$params['mesAnoRef']}' as date) + INTERVAL '1 month')
			AND aip_ent.ativo = 'S'
			AND aip.idvidautil = aip_ent.idvidautil
                        AND aip.iditempatrimonio = aip_ent.iditempatrimonio
			AND cm_instituicao.idinstituicao IN {$params['idsRef']}
		GROUP BY aip_ent.idvidautil), 0) as entrada
		FROM ad_itempatrimonio aip
			INNER JOIN cm_setor ON aip.idsetor = cm_setor.idsetor
			INNER JOIN cm_instituicao ON cm_setor.idinstituicao = cm_instituicao.idinstituicao
			INNER JOIN ad_vidautil ON aip.idvidautil = ad_vidautil.idvidautil
                        INNER JOIN ad_notafiscal nt ON nt.idnotafiscal = aip.idnotafiscal
		WHERE cm_instituicao.idinstituicao IN {$params['idsRef']}
		GROUP BY aip.idvidautil, ad_vidautil.descricao, 
aip.iditempatrimonio,aip.descricao,nt.notafiscal,nt.datanotafiscal,nt.cnpj,nt.dataateste
		ORDER BY aip.idvidautil;");
	}

}