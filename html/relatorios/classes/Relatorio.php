<?php
require_once 'classes/DataSource.php';

abstract class Relatorio {

	/**
	 * Instância da classe DataSource.
	 *
	 * @var DataSource
	 * @access protected
	 */
	public $dataSource;

	/**
	 * Configuração do banco de dados.
	 * @var array
	 * @access protected
	 */
	private $config = array(
		'persistent' => true,
		'host' => 'localhost',
		'user' => 'postgres',
		'password' => 'postgres',
		'database' => 'dbsiga',
		'schema' => 'public',
		'port' => 5432,
		'encoding' => 'utf8',
	);

	/**
	 * Construtor da classe.
	 *
	 * @access public
	 * @return void
	 */
	public function __construct($config = array()) {
		if (isset($config) && !empty($config)){
			$this->dataSource = DataSource::getInstance($config);
		} else {
			$this->dataSource = DataSource::getInstance($this->config);
		}
	}

	/**
	 * Função abstrata que irá executar a query do relatório.
	 *
	 * @abstract
	 * @param array $params
	 * @access public
	 */
	public abstract function geraRelatorio($params = array());
}
