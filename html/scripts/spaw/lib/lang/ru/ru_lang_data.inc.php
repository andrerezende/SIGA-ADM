<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// Russian language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Copyright: Solmetra (c)2003 All rights reserved.
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-04-10
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'windows-1251';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array
(
        'cut' => array('title' => 'Âûðåçàòü'),
        'copy' => array('title' => 'Êîïèðîâàòü'),
        'paste' => array('title' => 'Âñòàâèòü'),
        'undo' => array('title' => 'Îòìåíèòü'),
        'redo' => array('title' => 'Ïîâòîðèòü'),
        'image_insert' => array('title' => 'Âñòàâèòü èçîáðàæåíèå',
                                'select' => 'Âñòàâèòü', 'delete' => 'Ñòåðåòü',                                                                                                                                                                                                                                                                                                                                                                                                                                // new 1.0.5
                                'cancel' => 'Îòìåíèòü', 'library' => 'Áèáëèîòåêà', 'preview' => 'Ïðîñìîòð', 'images' => 'Èçîáðàæåíèÿ', 'upload' => 'Çàãðóçèòü èçîáðàæåíèå', 'upload_button' => 'Çàãðóçèòü', 'error' => 'Îøèáêà', 'error_no_image' => 'Âûáåðèòå èçîáðàæåíèå', 'error_uploading' => 'Âî âðåìÿ çàãðóçêè ïðîèçîøëà îøèáêà. Ïîïðîáóéòå åùå ðàç.', 'error_wrong_type' => 'Íåïðàâèëüíûé òèï èçîáðàæåíèÿ', 'error_no_dir' => 'Áèáëèîòåêà íå ñóùåñòâóåò', 'error_cant_delete' => 'Ñòåðåòü íå óäàëîñü', // new 1.0.5
),
        'image_prop' => array('title' => 'Ïàðàìåòðû èçîáðàæåíèÿ', 'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü', 'source' => 'Èñòî÷íèê', 'alt' => 'Êðàòêîå îïèñàíèå', 'align' => 'Âûðàâíèâàíèå', 'left' => 'ñëåâà (left)', 'right' => 'ñïðàâà (right)', 'top' => 'ñâåðõó (top)', 'middle' => 'â öåíòðå (middle)', 'bottom' => 'ñíèçó (bottom)', 'absmiddle' => 'àáñ. öåíòð (absmiddle)', 'texttop' => 'ñâåðõó (texttop)', 'baseline' => 'ñíèçó (baseline)', 'width' => 'Øèðèíà', 'height' => 'Âûñîòà', 'border' => 'Ðàìêà', 'hspace' => 'Ãîð. ïîëÿ', 'vspace' => 'Âåðò. ïîëÿ', 'error' => 'Îøèáêà', 'error_width_nan' => 'Øèðèíà íå ÿâëÿåòñÿ ÷èñëîì', 'error_height_nan' => 'Âûñîòà íå ÿâëÿåòñÿ ÷èñëîì', 'error_border_nan' => 'Ðàìêà íå ÿâëÿåòñÿ ÷èñëîì', 'error_hspace_nan' => 'Ãîðèçîíòàüíûå ïîëÿ íå ÿâëÿåòñÿ ÷èñëîì', 'error_vspace_nan' => 'Âåðòèêàëüíûå ïîëÿ íå ÿâëÿåòñÿ ÷èñëîì',),
        'hr' => array('title' => 'Ãîðèçîíòàëüíàÿ ëèíèÿ'),
        'table_create' => array('title' => 'Ñîçäàòü òàáëèöó'),
        'table_prop' => array('title' => 'Ïàðàìåòðû òàáëèöû', 'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü', 'rows' => 'Ñòðîêè', 'columns' => 'Ñòîëáöû', 'css_class' => 'Ñòèëü',                                                                                                                                                               // <=== new 1.0.6
                        'width' => 'Øèðèíà', 'height' => 'Âûñîòà', 'border' => 'Ðàìêà', 'pixels' => 'ïèêñ.', 'cellpadding' => 'Îòñòóï îò ðàìêè', 'cellspacing' => 'Ðàñòîÿíèå ìåæäó ÿ÷åéêàìè', 'bg_color' => 'Öâåò ôîíà', 'background' => 'Ôîíîâîå èçîáðàæåíèå',                                                                           // <=== new 1.0.6
                        'error' => 'Îøèáêà', 'error_rows_nan' => 'Ñòðîêè íå ÿâëÿåòñÿ ÷èñëîì', 'error_columns_nan' => 'Ñòîëáöû íå ÿâëÿåòñÿ ÷èñëîì', 'error_width_nan' => 'Øèðèíà íå ÿâëÿåòñÿ ÷èñëîì', 'error_height_nan' => 'Âûñîòà íå ÿâëÿåòñÿ ÷èñëîì', 'error_border_nan' => 'Ðàìêà íå ÿâëÿåòñÿ ÷èñëîì', 'error_cellpadding_nan' => 'Îòñòóï îò ðàìêè íå ÿâëÿåòñÿ ÷èñëîì', 'error_cellspacing_nan' => 'Ðàñòîÿíèå ìåæäó ÿ÷åéêàìè íå ÿâëÿåòñÿ ÷èñëîì',),
        'table_cell_prop' => array('title' => 'Ïàðàìåòðû ÿ÷åéêè', 'horizontal_align' => 'Ãîðèçîíòàëüíîå âûðàâíèâàíèå', 'vertical_align' => 'Âåðòèêàëüíîå âûðàâíèâàíèå', 'width' => 'Øèðèíà', 'height' => 'Âûñîòà', 'css_class' => 'Ñòèëü', 'no_wrap' => 'Áåç ïåðåíîñà', 'bg_color' => 'Öâåò ôîíà', 'background' => 'Ôîíîâîå èçîáðàæåíèå', // <=== new 1.0.6
                             'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü', 'left' => 'Ñëåâà', 'center' => 'Â öåíòðå', 'right' => 'Ñïðàâà', 'top' => 'Ñâåðõó', 'middle' => 'Â öåíòðå', 'bottom' => 'Ñíèçó', 'baseline' => 'Áàçîâàÿ ëèíèÿ òåêñòà', 'error' => 'Îøèáêà', 'error_width_nan' => 'Øèðèíà íå ÿâëÿåòñÿ ÷èñëîì', 'error_height_nan' => 'Âûñîòà íå ÿâëÿåòñÿ ÷èñëîì',),
        'table_row_insert' => array('title' => 'Âñòàâèòü ñòðîêó'),
        'table_column_insert' => array('title' => 'Âñòàâèòü ñòîëáåö'),
        'table_row_delete' => array('title' => 'Óäàëèòü ñòðîêó'),
        'table_column_delete' => array('title' => 'Óäàëèòü ñòîëáåö'),
        'table_cell_merge_right' => array('title' => 'Îáúåäèíèòü âïðàâî'),
        'table_cell_merge_down' => array('title' => 'Îáúåäèíèòü âëåâî'),
        'table_cell_split_horizontal' => array('title' => 'Ðàçäåëèòü ïî ãîðèçîíòàëè'),
        'table_cell_split_vertical' => array('title' => 'Ðàçäåëèòü ïî âåðòèêàëè'),
        'style' => array('title' => 'Ñòèëü'),
        'font' => array('title' => 'Øðèôò'),
        'fontsize' => array('title' => 'Ðàçìåð'),
        'paragraph' => array('title' => 'Àáçàö'),
        'bold' => array('title' => 'Æèðíûé'),
        'italic' => array('title' => 'Êóðñèâ'),
        'underline' => array('title' => 'Ïîä÷åðêíóòûé'),
        'ordered_list' => array('title' => 'Óïîðÿäî÷åííûé ñïèñîê'),
        'bulleted_list' => array('title' => 'Íåóïîðÿäî÷åííûé ñïèñîê'),
        'indent' => array('title' => 'Óâåëè÷èòü îòñòóï'),
        'unindent' => array('title' => 'Óìåíüøèòü îòñòóï'),
        'left' => array('title' => 'Âûðàâíèâàíèå ñëåâà'),
        'center' => array('title' => 'Âûðàâíèâàíèå ïî öåíòðó'),
        'right' => array('title' => 'Âûðàâíèâàíèå ñïðàâà'),
        'fore_color' => array('title' => 'Öâåò òåêñòà'),
        'bg_color' => array('title' => 'Öâåò ôîíà'),
        'design_tab' => array('title' => 'Ïåðåêëþ÷èòüñÿ â ðåæèì ìàêåòèðîâàíèÿ (WYSIWYG)'),
        'html_tab' => array('title' => 'Ïåðåêëþ÷èòüñÿ â ðåæèì ðåäàêòèðîâàíèÿ êîäà (HTML)'),
        'colorpicker' => array('title' => 'Âûáîð öâåòà', 'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü',),
        'cleanup' => array('title' => '×èñòêà HTML', 'confirm' => 'Ýòà îïåðàöèÿ óáåðåò âñå ñòèëè, øðèôòû è íåíóæíûå òýãè èç òåêóùåãî ñîäåðæèìîãî ðåäàêòîðà. ×àñòü èëè âñå âàøå ôîðìàòèîëâàíèå ìîæåò áûòü óòåðÿíî.', 'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü',),
        'toggle_borders' => array('title' => 'Âêëþ÷èòü ðàìêè',),
        'hyperlink' => array('title' => 'Ãèïåðññûëêà', 'url' => 'Àäðåñ', 'name' => 'Èìÿ', 'target' => 'Îòêðûòü', 'title_attr' => 'Íàçâàíèå', 'a_type' => 'Òèï', // <=== new 1.0.6
                       'type_link' => 'Ññûëêà',                                                                                                                 // <=== new 1.0.6
                       'type_anchor' => 'ßêîðü',                                                                                                                // <=== new 1.0.6
                       'type_link2anchor' => 'Ññûëêà íà ÿêîðü',                                                                                                 // <=== new 1.0.6
                       'anchors' => 'ßêîðÿ',                                                                                                                    // <=== new 1.0.6
                       'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü',),
        'hyperlink_targets' => array(                                                                                                                           // <=== new 1.0.5
                                   '_self' => 'â òîì æå ôðåéìå (_self)', '_blank' => 'â íîâîì îêíå (_blank)', '_top' => 'íà âñå îêíî (_top)', '_parent' => 'â ðîäèòåëüñêîì ôðåéìå (_parent)'),
        'table_row_prop' => array('title' => 'Ïàðàìåòðû ñòðîêè', 'horizontal_align' => 'Ãîðèçîíòàëüíîå âûðàâíèâàíèå', 'vertical_align' => 'Âåðòèêàëüíîå âûðàâíèâàíèå', 'css_class' => 'Ñòèëü', 'no_wrap' => 'Áåç ïåðåíîñà', 'bg_color' => 'Öâåò ôîíà', 'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü', 'left' => 'Ñëåâà', 'center' => 'Â öåíòðå', 'right' => 'Ñïðàâà', 'top' => 'Ñâåðõó', 'middle' => 'Â öåíòðå', 'bottom' => 'Ñíèçó', 'baseline' => 'Áàçîâàÿ ëèíèÿ òåêñòà',),
        'symbols' => array('title' => 'Ñïåö. ñèìâîëû', 'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü',),
        'templates' => array('title' => 'Øàáëîíû',),
        'page_prop' => array('title' => 'Ïàðàìåòðû ñòðàíèöû', 'title_tag' => 'Çàãîëîâîê', 'charset' => 'Íàáîð ñèìâîëîâ', 'background' => 'Ôîíîâîå èçîáðàæåíèå', 'bgcolor' => 'Öâåò ôîíà', 'text' => 'Öâåò òåêñòà', 'link' => 'Öâåò ññûëîê', 'vlink' => 'Öâåò ïîñùåííûõ ññûëîê', 'alink' => 'Öâåò àêòèâíûõ ññûëîê', 'leftmargin' => 'Îòñòóï ñëåâà', 'topmargin' => 'Îòñòóï ñâåðõó', 'css_class' => 'Ñòèëü', 'ok' => 'ÃÎÒÎÂÎ', 'cancel' => 'Îòìåíèòü',),
        'preview' => array('title' => 'Ïðåäâàðèòåëüíûé ïðîñìîòð',),
        'image_popup' => array('title' => 'Popup èçîáðàæåíèÿ',),
        'zoom' => array('title' => 'Óâåëè÷åíèå',),
        'subscript' => array(   // <=== new 1.0.7
                           'title' => 'Íèæíèé èíäåêñ',),
        'superscript' => array( // <=== new 1.0.7
                             'title' => 'Âåðõíèé èíäåêñ',),
);
?>
