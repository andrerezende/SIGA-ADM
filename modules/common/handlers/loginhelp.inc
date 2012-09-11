<?
    $theme->ClearContent();
    $theme->AppendContent(new Text('','<b>Para entrar no SIGA:</b><br><br>'));
    $theme->AppendContent(new Text('','<b>Identificação do Usuário:</b> docentes e técnicos-administrativos: número SIAPE com 7 dígitos (ex. 1101234); alunos -> número da matrícula'));
    $theme->AppendContent(new Separator());  
    $theme->AppendContent(new Text('','<b>Senha:</b> A senha inicial é sua data de nascimento no formato DDMMAA, onde DD é o dia, MM é o mês e AA é o ano (ex. 150276)'));
    $theme->AppendContent(new Separator());  
    $theme->AppendContent(new Text('','<b>IMPORTANTE:</b> Para sua segurança, você deve alterar sua senha após acessar o sistema pela primeira vez (utilizando a opção [Alterar Senha] no menu).'));
    $theme->AppendContent(new Separator());  
    $theme->AppendContent(new FormButton('btnClose', 'Fechar'));

?>
