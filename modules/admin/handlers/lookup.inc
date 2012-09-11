<?php
$MIOLO->history->pop();
$lookup = new MLookup($module);
$file = $MIOLO->GetModulePath($lookup->module,'db/lookup.class');
if ( file_exists( $file ) )
{
   $ok = $MIOLO->Uses('/db/lookup.class',$lookup->module);
}
else
{
   $ok = $MIOLO->Uses('/classes/lookup.class',$lookup->module);
}
$MIOLO->Assert($ok,_M('Arquivo modules/@1/classes/lookup.class não encontrado.<br>'.
                      'Este arquivo deve implementar a classe Business@1Lookup '.
                      'contendo a função Lookup@2.', 
                      'miolo',$lookup->module, $lookup->item));
$page->AddScript('m_lookup.js');
$page->SetTitle('Janela de Pesquisa');
$businessClass = "Business{$lookup->module}Lookup";
$lookupMethod = "Lookup{$lookup->item}";
$object = new $businessClass();
$object->$lookupMethod($lookup);
$page->SetAction($lookup->href);
$theme->SetContent($lookup->grid);
$theme->SetLayout('lookup');
?>
