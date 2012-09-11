<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
  
    $navbar->AddOption('Manutenção de Veículos', 'adm', 'main:manutencaoveiculos');
    $navbar->AddOption('Relatórios', 'adm', 'main:relatoriosmanutencaoveiculos');
    $navbar->AddOption('Gastos com Manutenção', 'adm', 'main:relatoriosmanutencaoveiculos');
    $form = $MIOLO->GetUI()->GetForm($module,'frmRelatorioManutencoesVeiculo');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
