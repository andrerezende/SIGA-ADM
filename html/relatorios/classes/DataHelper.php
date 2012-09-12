<?php
class DataHelper {

	/**
	 * Formata a data para o padrão brasileiro.
	 *
	 * @param integer $data Data em timestamp ou null para atual
	 * @return string Data no formato dd/mm/aaaa
	 * @access public
	 */
	public function data($data = null) {
		$data = $this->_ajustaDataHora($data);
		return date('d/m/Y', $data);
	}

	public function dataHora($data = null) {
		$data = $this->_ajustaDataHora($data);
		return date('d/m/Y H:i', $data);
	}

	/**
	 * Mostrar a data completa
	 *
	 * @param integer $dataHora Data e hora em timestamp ou null para atual
	 * @return string Descrição da data no estilo "Sexta-feira", 01 de Janeiro de 2010, 00:00:00"
	 * @access public
	 */
	public function dataCompleta($dataHora = null) {
		$_diasDaSemana = array('Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado');
		$_meses = array('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');

		$dataHora = $this->_ajustaDataHora($dataHora);
		$w = date('w', $dataHora);
		$n = date('n', $dataHora) - 1;

		return sprintf('%s, %02d de %s de %04d, %s', $_diasDaSemana[$w], date('d', $dataHora), $_meses[$n], date('Y', $dataHora), date('H:i:s', $dataHora));
	}

	/**
	 * Se a data for nula, usa data atual
	 *
	 * @param mixed $data
	 * @return integer Se null, retorna a data/hora atual
	 * @access protected
	 */
	protected function _ajustaDataHora($data) {
		if (is_null($data)) {
			return time();
		}
		if (is_integer($data) || ctype_digit($data)) {
			return (int)$data;
		}
		return strtotime((string)$data);
	}

	public function mesAno($data) {
		$data = explode('/', $data);
		$data = mktime(0, 0, 0, $data[1], $data[0], $data[2]);
		return date('m-Y', $data);
	}

}