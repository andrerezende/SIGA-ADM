<?php
/**
 * DataSource
 *
 * PHP 5
 *
 * Cria e executa funções de um objeto PDO de acordo com as
 * configurações passadas no array de configuração.
 *
 * @package		relatorios.classes
 * @author		Vitor Pacheco <vitor.pacheco@ifbaiano.edu.br>
 * @version 0.1
 */
class DataSource {

	/**
	 * Identifica se está conectado ou não.
	 *
	 * @var boolean
	 * @access public
	 */
	public $connected = false;

	/**
	 * Uma referência a conexão utilizada pela
	 * classe.
	 *
	 * @var PDO
	 * @access public
	 */
	public $connection = null;

	/**
	 * Descrição do erro da última query
	 * executada.
	 *
	 * @var string
	 * @access public
	 */
	public $error = null;

	/**
	 * Configuração do banco de dados.
	 * @var array
	 * @access protected
	 */
	protected $_config = array(
		'persistent' => true,
		'host' => 'localhost',
		'user' => 'root',
		'password' => '',
		'database' => 'dbsiga',
		'schema' => 'public',
		'port' => 5432,
		'encoding' => 'utf8',
	);
	protected $_result = null;

	/**
	 * Instância da classe DataSource.
	 *
	 * @var DataSource
	 * @access private
	 */
	private static $instance = null;

	/**
	 * Instancia a classe DataSource e seta as configurações
	 * passadas como parâmetro.
	 *
	 * @param array $config
	 * @access private
	 */
	private function __construct($config = array()) {
		$this->setConfig($config);
		$this->connect();
	}

	/**
	 * Retorna a instância da classe.
	 *
	 * @param array $config
	 * @access public
	 * @return DataSource
	 */
	public static function getInstance($config = array()) {
		if (DataSource::$instance == null) {
			DataSource::$instance = new DataSource($config);
		}
		return DataSource::$instance;
	}

	/**
	 * Seta as configurações na instância da classe
	 * DataSource.
	 *
	 * @param array $config
	 * @access public
	 * @return void
	 */
	public function setConfig($config = array()) {
		$this->_config = array_merge($this->_config, $config);
	}

	/**
	 * Executa a conexão com o banco de dados.
	 *
	 * @return void
	 * @throws PDOException
	 */
	public function connect() {
		$config = $this->_config;
		$this->connected = false;
		try {
			$flags = array(PDO::ATTR_PERSISTENT => $config['persistent']);
			$this->connection = new PDO(
				"pgsql:host={$config['host']};port={$config['port']};dbname={$config['database']}",
				$config['user'],
				$config['password'],
				$flags
			);
			$this->connected = true;
			if (!empty($config['encoding'])) {
				$this->setEncoding($config['encoding']);
			}
			if (!empty($config['schema'])) {
				$this->_execute('SET search_path TO ' . $config['schema']);
			}
		} catch (PDOException $e) {
			throw new PDOException($e->getMessage());
		}
	}

	/**
	 * Utiliza o método DataSource::_execute() para executar as querys no banco,
	 * caso ocorra algum erro, mostra o debug.
	 *
	 * @param string $sql
	 * @param array $options
	 * @param array $params
	 */
	public function execute($sql, $options = array(), $params = array()) {
		$this->error = null;

		$this->_result = $this->_execute($sql, $params);

		if ($this->error) {
			$this->showQuery($sql);
			return false;
		}
		return $this->_result;
	}

	/**
	 *
	 * @param string $sql
	 * @param array $params
	 * @param array $prepareOptions
	 */
	protected function _execute($sql, $params = array(), $prepareOptions = array()) {
		$sql = trim($sql);
		if (preg_match('/^(?:CREATE|ALTER|DROP)/i', $sql)) {
			return false;
		}

		try {
			$query = $this->connection->prepare($sql, $prepareOptions);
			$query->setFetchMode(PDO::FETCH_LAZY);
			if (!$query->execute($params)) {
				$this->_result = $query;
				$this->error = $this->lastError($query);
				return false;
			}
			return $query->fetchAll(PDO::FETCH_OBJ);
		} catch (PDOException $e) {
			$this->_result = null;
			$this->error = $e->getMessage();
			return false;
		}
	}

	public function lastError(PDOStatement $query = null) {
		$error = $query->errorInfo();
		if (empty($error[2])) {
			return null;
		}
		return $error[1] . ': ' . $error[2];
	}

	public function setEncoding($encoding) {
		if ($this->_execute('SET NAMES ?', array($encoding))) {
			return true;
		}
		return false;
	}

	public function showQuery($sql) {
		$error = $this->error;
		if (strlen($sql) > 200) {
			$sql = substr($sql, 0, 200) . '[...]';
		}
		if (ini_get('display_errors') > 0) {
			$out = null;
			if ($error) {
				trigger_error('<span style="color:Red;text-align:left"><b>SQL Error</b> ' . $this->error . '</span>', E_USER_WARNING);
				print_r(sprintf('<p style="text-align:left"><b>Query:</b> %s %s</p>', $sql, $out));
			}
		}
	}

	public function disconnect() {
		unset($this->connection);
		$this->connected = false;
		return true;
	}

}