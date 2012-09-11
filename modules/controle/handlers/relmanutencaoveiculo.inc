<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
  
    $navbar->AddOption('Manutenção de Veículos', 'controle', 'main:manutencaoveiculos');
    $navbar->AddOption('Relatórios', 'controle', 'main:relatoriosveiculos');
    $navbar->AddOption('Gastos com Manutenção', 'controle', 'main:relatoriosveiculos');
    $form = $MIOLO->GetUI()->GetForm($module,'frmRelatorioManutencoesVeiculo');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>