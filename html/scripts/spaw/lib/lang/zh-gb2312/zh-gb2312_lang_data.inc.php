<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// Chinese gb2312 language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Chinese translation: aman@wealthgrp.com.tw;aman@516888.com;aman77@pchome.com.tw
// Copyright: Solmetra (c)2003 All rights reserved.
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-03-20
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'gb2312';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array
(
        'cut' => array('title' => '¼ôÏÂ'),
        'copy' => array('title' => '¸´ÖÆ'),
        'paste' => array('title' => 'ÌùÉÏ'),
        'undo' => array('title' => '¸´Ô­'),
        'redo' => array('title' => '·´¸´Ô­'),
        'hyperlink' => array('title' => '³¬Á¬½á'),
        'image_insert' =>
array('title' => '²åÈëÍ¼Æ¬', 'select' => 'Ñ¡È¡',
                  'cancel' => 'È¡Ïû',                                  'library' => '×ÊÁÏ¼Ð',
                  'preview' => 'Ô¤ÀÀ',                                 'images' => 'Í¼Æ¬',
                  'upload' => 'ÉÏ´«Í¼Æ¬',                              'upload_button' => 'ÉÏ´«',
                  'error' => '´íÎó',                                   'error_no_image' => 'ÇëÑ¡¶¨Í¼Æ¬',
                  'error_uploading' => 'µµ°¸ÉÏ´«·¢Éú´íÎó. ÇëÉÔááÖØ´«', 'error_wrong_type' => 'µµ°¸ÐÍÌ¬²»·û',
                  'error_no_dir' => 'ÕÒ²»µ½×ÊÁÏ¼Ð',),
        'image_prop' => array('title' => 'Í¼µµÊôÐÔ', 'ok' => '   È·¶¨   ',
                              'cancel' => 'È¡Ïû',                       'source' => 'À´Ô´',
                              'alt' => 'ÎÄ×ÖÌáÊ¾',                      'align' => '¶ÔÆë',
                              'left' => '×ó',                           'right' => 'ÓÒ',
                              'top' => 'ÉÏ',                            'middle' => 'ÖÐ',
                              'bottom' => 'ÏÂ',                         'absmiddle' => '¾ø¶ÔÖÐÑë',
                              'texttop' => 'ÎÄ×Ö¶¥¶Ë',                  'baseline' => '»ù×¼Ïß',
                              'width' => '¿í¶È',                        'height' => '¸ß¶È',
                              'border' => '±ß¿ò¿í¶È',                   'hspace' => 'Ë®Æ½¼ä¾à',
                              'vspace' => '´¹Ö±¼ä¾à',                   'error' => '´íÎó',
                              'error_width_nan' => '¿í¶È²»ÊÇÊý×Ö',      'error_height_nan' => '¸ß¶È²»ÊÇÊý×Ö',
                              'error_border_nan' => '±ß¿ò¿í¶È²»ÊÇÊý×Ö', 'error_hspace_nan' => 'Ë®Æ½¼ä¾à²»ÊÇÊý×Ö',
                              'error_vspace_nan' => '´¹Ö±¼ä¾à²»ÊÇÊý×Ö',),
        'hr' => array('title' => 'Ë®Æ½¹æÏß'),
        'table_create' => array('title' => 'ÐÂÔö±í¸ñ'),
        'table_prop' =>
array('title' => '±í¸ñÊôÐÔ', 'ok' => '   È·¶¨   ',
                  'cancel' => 'È¡Ïû',                            'rows' => 'ÁÐÊý',
                  'columns' => 'ÐÐÊý',                           'width' => '¿í¶È',
                  'height' => '¸ß¶È',                            'border' => '±ß¿ò¿í¶È',
                  'pixels' => 'px',                              'cellpadding' => 'ÎÄ¿ò¼ä¾à',
                  'cellspacing' => '¿òÏß¼ä¾à',                   'bg_color' => '±³¾°ÑÕÉ«',
                  'error' => '´íÎó',                             'error_rows_nan' => 'ÁÐÊý²»ÊÇÊý×Ö',
                  'error_columns_nan' => 'ÐÐÊý²»ÊÇÊý×Ö',         'error_width_nan' => '¿í¶È²»ÊÇÊý×Ö',
                  'error_height_nan' => '¸ß¶È²»ÊÇÊý×Ö',          'error_border_nan' => '±ß¿ò¿í¶È²»ÊÇÊý×Ö',
                  'error_cellpadding_nan' => 'ÎÄ¿ò¼ä¾à²»ÊÇÊý×Ö', 'error_cellspacing_nan' => '¿òÏß¼ä¾à²»ÊÇÊý×Ö',),
        'table_cell_prop' =>
array('title' => '´¢´æ¸ñÊôÐÔ', 'horizontal_align' => 'Ë®Æ½¶ÔÆë', 'vertical_align' => '´¹Ö±¶ÔÆë',
                  'width' => '¿í¶È',                   'height' => '¸ß¶È',               'css_class' => 'CSS class',
                  'no_wrap' => 'ÎÄ×Ö²»×ªÐÐ',           'bg_color' => '±³¾°ÑÕÉ«',         'ok' => '   È·¶¨   ',
                  'cancel' => 'È¡Ïû',                  'left' => '×ó',                   'center' => 'ÖÐ',
                  'right' => 'ÓÒ',                     'top' => '¶¥',                    'middle' => 'ÖÐÑë',
                  'bottom' => 'µ×',                    'baseline' => '»ù×¼Ïß',           'error' => '´íÎó',
                  'error_width_nan' => '¿í¶È²»ÊÇÊý×Ö', 'error_height_nan' => '¸ß¶È²»ÊÇÊý×Ö',),
        'table_row_insert' => array('title' => '²åÈëºáÁÐ'),
        'table_column_insert' => array('title' => '²åÈëÖ±ÐÐ'),
        'table_row_delete' => array('title' => 'É¾³ýºáÁÐ'),
        'table_column_delete' => array('title' => 'É¾³ýÖ±ÐÐ'),
        'table_cell_merge_right' => array('title' => 'ºÏ²¢ÓÒ²à'),
        'table_cell_merge_down' => array('title' => 'ºÏ²¢ÏÂ·½'),
        'table_cell_split_horizontal' => array('title' => 'Ë®Æ½·Ö¸î'),
        'table_cell_split_vertical' => array('title' => '´¹Ö±·Ö¸î'),
        'style' => array('title' => 'Style'),
        'font' => array('title' => '×ÖÌå'),
        'fontsize' => array('title' => '×ÖºÅ'),
        'paragraph' => array('title' => 'Paragraph'),
        'bold' => array('title' => '´ÖÌå'),
        'italic' => array('title' => 'Ð±Ìå'),
        'underline' => array('title' => '¼Óµ×Ïß'),
        'ordered_list' => array('title' => 'ÐòºÅ±íÁÐ'),
        'bulleted_list' => array('title' => 'µãºÅ±íÁÐ'),
        'indent' => array('title' => 'Ôö¼ÓËõÅÅ'),
        'unindent' => array('title' => '¼õÉÙËõÅÅ'),
        'left' => array('title' => '¿¿×óÇÐÆë'),
        'center' => array('title' => 'ÖÃÖÐ¶ÔÆë'),
        'right' => array('title' => '¿¿ÓÒÇÐÆë'),
        'fore_color' => array('title' => '×ÖÌåÑÕÉ«'),
        'bg_color' => array('title' => '±³¾°ÑÕÉ«'),
        'design_tab' => array('title' => 'ÇÐ»» WYSIWYG (Ö±¾õ) Ä£Ê½'),
        'html_tab' => array('title' => 'ÇÐ»» HTML (Ô´Âë) Ä£Ê½'),
        'colorpicker' => array('title' => 'µ÷É«ÅÌ', 'ok' => '   È·¶¨   ', 'cancel' => 'È¡Ïû',),
// <<<<<<<<< NEW >>>>>>>>>
        'cleanup' => array('title' => 'Çå³ýHTML (ÒÆ³ýÍøÒ³¸ñÊ½)', 'confirm' => 'Õâ¸ö¶¯×÷½«»áÇå³ýËùÓÐµÄÍøÒ³¸ñÊ½£¬Çë×¢Òâ.',
                           'ok' => '   È·¶¨   ',                 'cancel' => 'È¡Ïû',),
        'toggle_borders' => array('title' => 'ÇÐ»»±ßÏß',),
        'hyperlink' =>
array('title' => '³¬Á¬½á', 'url' => 'ÍøÖ·', 'name' => 'Ãû³Æ', 'target' => 'Ä¿±ê', 'title_attr' => 'Ö÷Ìâ',
                  'ok' => '   È·¶¨   ', 'cancel' => 'È¡Ïû',),
        'table_row_prop' =>
array('title' => 'ºáÁÐÊôÐÔ', 'horizontal_align' => 'Ë®Æ½¶ÔÆë', 'vertical_align' => '´¹Ö±¶ÔÆë',
                  'css_class' => 'CSS class', 'no_wrap' => '²»»»ÐÐ',            'bg_color' => '±³¾°ÑÕÉ«',
                  'ok' => '   È·¶¨   ',       'cancel' => 'È¡Ïû',               'left' => '×ó',
                  'center' => 'ÖÐ',           'right' => 'ÓÒ',                  'top' => '¶¥',
                  'middle' => 'ÖÐÑë',         'bottom' => 'µ×²¿',               'baseline' => '»ùÏß',),
        'symbols' => array('title' => 'ÌØÊâ·ûºÅ', 'ok' => '   È·¶¨   ', 'cancel' => 'È¡Ïû',),
        'symbols' => array('title' => 'ÌØÊâ·ûºÅ', 'ok' => '   È·¶¨   ', 'cancel' => 'È¡Ïû',),
        'templates' => array('title' => 'Ä£°å',),
        'page_prop' => array('title' => 'ÍøÒ³ÊôÐÔ', 'title_tag' => 'Ö÷Ìâ', 'charset' => 'ÎÄ×Ö±àÂë',
                             'background' => '±³¾°Í¼Æ¬', 'bgcolor' => '±³¾°ÑÕÉ«',       'text' => 'ÎÄ×ÖÑÕÉ«',
                             'link' => 'Á¬½áÑÕÉ«',       'vlink' => '²Î¹Û¹ýµÄÁ¬½áÑÕÉ«', 'alink' => 'ÕýÔÚÖ´ÐÐµÄÁ¬½áÑÕÉ«',
                             'leftmargin' => '×ó±ß½ç',   'topmargin' => 'ÉÏ·½±ß½ç',     'css_class' => 'CSS class',
                             'ok' => '   È·¶¨   ',       'cancel' => 'È¡Ïû',),
        'preview' => array('title' => 'Ô¤ÀÀ',),
        'image_popup' => array('title' => 'Í¼Æ¬µ¯³ö',),
        'zoom' => array('title' => 'Zoom',),
);
?>
