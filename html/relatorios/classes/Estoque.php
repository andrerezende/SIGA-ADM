<?php
require_once 'classes/Relatorio.php';

/**
 * Classe responsável por gerar o relatório de Estoque.
 *
 * @name Estoque
 * @package classes.relatorio
 * @version 0.1
 * @author Vitor Pacheco <vitor.pacheco@ifbaiano.edu.br>
 */
class Estoque extends Relatorio {

	/**
	 * Método de geração do relatório de Estoque.
	 *
	 * @see Relatorio::geraRelatorio()
	 */
	public function geraRelatorio($params = array()) {
		return $this->dataSource->execute("
			SELECT
				m.idmaterial,
				m.datamov AS data,
                                m.tipomovimento AS tipo,
                                m.notafiscal AS notafiscal,
				m.empenho AS empenho,
				m.quantidade AS quant,
				m.valorunitario AS valor_unitario,
				m.quantidade AS quantentregue,
				m.idrequisicao AS requisicao,
				b.tipo AS tipo_baixa,
                                b.observacao AS observacao
			FROM ad_movimento m
				LEFT JOIN ad_baixaalmox b ON b.idmovimento = m.idmovimento
			WHERE m.idmaterial = {$params['idMaterial']} 
				AND m.idmovimentoref IS NULL
			AND m.iduoalmox={$params['idUO']}
			ORDER BY m.datamov, m.idmovimento;
		");
	}

	/**
	 * Retorna os dados do material solicitado.
	 *
	 * Ex.:
	 * $estoque = new Estoque();
	 * var_dump($estoque->getMaterial(array('idMaterial' => 123)));
	 *
	 * @param array $params
	 * @return array
	 */
	public function getMaterial($params = array()) {
		$material = $this->dataSource->execute("
			SELECT ma.*
			FROM ad_material ma
			INNER JOIN ad_movimento mo
			ON ma.idmaterial=mo.idmaterial
			WHERE ma.idmaterial = {$params['idMaterial']}
			AND mo.iduoalmox={$params['idUO']} 
			LIMIT 1;
		");
		return $material[0];
	}

	/**
	 * Retorna as Entradas de um material.
	 *
	 * Ex.:
	 * $estoque = new Estoque();
	 * var_dump($estoque->getEntradas(array('idMaterial' => 123)));
	 *
	 * @param array $params
	 * @return type
	 */
	protected function getEntradas($params = array()) {
		return $this->dataSource->execute("
			SELECT
				m.idmaterial,
				m.datahora AS data,
                                m.tipomovimento AS tipo,
				m.quantidade AS quant,
				m.valortotal/m.quantidade AS valor_unitario,
				m.quantidade AS quantentregue,
				m.notafiscal AS notafiscal,
				m.empenho AS empenho
			FROM ad_movimento m
			WHERE m.idmaterial = {$params['idMaterial']} AND m.tipomovimento::INTEGER = ANY('{1, 5}'::INTEGER[])
				AND m.idmovimentoref IS NULL
			AND m.iduoalmox={$params['idUO']}
			ORDER BY m.datahora, m.idmaterial, m.datamov;
		");
	}

	/**
	 * Retorna as Saídas de um material.
	 *
	 * Ex.:
	 * $estoque = new Estoque();
	 * var_dump($estoque->getSaidas(array('idMaterial' => 123)));
	 *
	 * @param array $params
	 * @return type
	 */
	protected function getSaidas($params = array()) {
		return $this->dataSource->execute("
			SELECT
				m.idmaterial,
				m.datahora AS data,
                                m.tipomovimento AS tipo,
				m.quantidade AS quant,
				m.valortotal/m.quantidade AS valor_unitario,
				m.quantidade AS quantentregue,
				m.idrequisicao AS requisicao,
				b.tipo || ' - ' || b.observacao AS tipo_observacao
			FROM ad_movimento m
				LEFT JOIN ad_baixaalmox b ON b.idmovimento = m.idmovimento
			WHERE m.idmaterial = {$params['idMaterial']} AND m.tipomovimento::INTEGER <> ALL('{1, 5}'::INTEGER[])
				AND m.idmovimentoref IS NULL
			AND m.iduoalmox={$params['idUO']}
			ORDER BY m.datahora, m.datamov, m.idmaterial;
		");
	}

}