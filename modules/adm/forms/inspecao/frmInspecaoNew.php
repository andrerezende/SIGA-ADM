<?php
class frmNovoMaterialNew extends MForm
{
	function __construct()
	{
		parent::__construct('Incluir Inspeção');
		$this->EventHandler();
	}


	function CreateFields()
	{
		$usuario = $this->manager->getBusiness('common','usuario');
		$usuario->getById($this->manager->GetLogin()->idkey);
		$uo = $this->manager->getbusiness('adm','uo');
		$idUsuario = $this->manager->GetLogin()->idkey;
		$uoAlocado = $uo->listByUsuario($idUsuario);
		if (count($uoAlocado->result) == 0)
		{
			$go = $this->manager->GetActionURL('adm','main','','');
			$this->manager->Error("Você não está alocado em nenhuma Unidade Orçamentária habilitada a fazer requisições.",$go);
		}
		else
		{
			$fields = array(
				new MTextField('codmaterial','','CATMAT',14,'Maximo 14 algarismos'),
				new MMultiLineField('descricao','','Descrição',500,6,50,'Máximo 500'),
				new MTextField('precoestimado','','Preço Estimado',12,'Separacao decimal por ponto'),
				new MSeparator('Dados para contato'),
				new MTextField('nome',$usuario->pessoa->nome,'Nome',52),
				new MTextField('telefone','','Telefone',12),
				new MTextField('email',$usuario->pessoa->email,'Email',52),
				new MSelection('idUoReq','','UO',$uo->listSiglaByUsuario($idUsuario)->result)
			);
		
			$this->SetFields($fields);
			$this->nome->setReadOnly(true);
			$validators = array(
				new MRequiredValidator('descricao'),
				new MPhoneValidator('telefone','','required'),
				new MEmailValidator('email','','required'),
			);
			$this->SetValidators($validators);
			$buttons = array(
				new MButton('btnNew', 'Sugerir Material')
			);
			$this->SetButtons($buttons);
		}
	}


	function btnNew_click()
	{
		$data = $this->GetData();
		$usuario = $this->manager->getBusiness('common','usuario');
		$usuario->getById($this->manager->GetLogin()->idkey);
		$material = $this->manager->getBusiness('adm','novomaterial');
		try
		{
			$material->beginTransaction();
			$material->setData($data);
			$material->setStatus(1);
			$material->dataPedido = date('d/m/Y');
			$material->setUsuario($this->manager->getLogin()->idkey);
			$material->ativo = "S";
			$material->idUoReq = Form::GetFormValue('idUoReq');
			$material->precoestimado = Form::GetFormValue('precoestimado');
			$material->save();
			if ($data->email != $usuario->pessoa->email)
			{
				$usuario->pessoa->setTransaction($material->getTransaction());
				$usuario->pessoa->email = $data->email;
				$usuario->pessoa->save();
			}
			$material->endTransaction();
			$material->Log(OP_INS,'Novo material inserido ['.$material->idNovoMaterial.']');
			$this->manager->information("Pedido de novo material efetuado com sucesso. O número do seu pedido é ".$material->idNovoMaterial,$this->manager->getActionUrl('adm','main:novomaterial:find') );
		}
		catch (Exception $e)
		{
			$this->AddError($e->GetMessage());
		}
	}
}
?>
