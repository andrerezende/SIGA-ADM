<?
$ui = $MIOLO->GetUI();
$theme->ClearContent();
$navbar->AddOption('Página não encontrada', $module, 'login');
$msg = array('A página requisitada não existe.',' Se o problema persistir entre em contato com a equipe de desenvolvimento pelo email siga@ufjf.edu.br');
$goto = $MIOLO->GetActionURL($module,$self);
$caption = 'Página não encontrada';
$event = '';
$MIOLO->Error($msg, $goto, $caption, $event);

?>
