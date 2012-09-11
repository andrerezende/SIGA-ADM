<?php
$lookup = new MLookup();
$ok = $MIOLO->Uses('/classes/lookup.class',$lookup->module);
$MIOLO->Assert($ok,_M('Arquivo modules/@1/classes/lookup.class não encontrado.<br>'.
                      'Este arquivo deve implementar a classe Business@1Lookup '.
                      'contendo a função Lookup@2.', 
                      'miolo',$lookup->module, $lookup->item));
$page->AddScript('m_popup.js');
$page->AddScript('m_lookup.js');
$lookup->SetGridClass('MActiveLookupGrid','','ui/controls/mactivelookupgrid.class');
$businessClass = "Business{$lookup->module}Lookup";
$lookupMethod = "Lookup{$lookup->item}";
$object = new $businessClass();
$object->$lookupMethod($lookup);
$page->SetAction($lookup->href);
$theme->SetContent($lookup->grid);
$theme->SetLayout('lookup');
?>
