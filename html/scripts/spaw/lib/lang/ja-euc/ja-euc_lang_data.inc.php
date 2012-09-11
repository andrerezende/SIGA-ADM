<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// Japanese file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Japanese Translation: DigiPower <http://pwr.jp/>
// Copyright: Solmetra (c)2003 All rights reserved.
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-03-20
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'EUC-JP';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array
(
        'cut' => array('title' => 'ÀÚ¤ê¼è¤ê'),
        'copy' => array('title' => '¥³¥Ô¡¼'),
        'paste' => array('title' => 'Å½¤êÉÕ¤±'),
        'undo' => array('title' => '¸µ¤ËÌá¤¹'),
        'redo' => array('title' => '¤ä¤êÄ¾¤¹'),
        'hyperlink' => array('title' => '¥Ï¥¤¥Ñ¡¼¥ê¥ó¥¯'),
        'image_insert' => array('title' => '¥¤¥á¡¼¥¸¤ÎÁÞÆþ',
                                'select' => ' ÁªÂò¤¹¤ë ',
                                'cancel' => '¥­¥ã¥ó¥»¥ë',
                                'library' => '¥é¥¤¥Ö¥é¥ê',
                                'preview' => '¥×¥ì¥Ó¥å¡¼',
                                'images' => '¥¤¥á¡¼¥¸',
                                'upload' => '¥¢¥Ã¥×¥í¡¼¥É',
                                'upload_button' => '¥¢¥Ã¥×¥í¡¼¥É',
                                'error' => '¥¨¥é¡¼',
                                'error_no_image' => '¥¤¥á¡¼¥¸¤ò»ØÄê¤·¤Æ²¼¤µ¤¤',
                                'error_uploading' =>
                              '¥¢¥Ã¥×¥í¡¼¥ÉÃæ¤Ë¥¨¥é¡¼¤¬µ¯¤³¤ê¤Þ¤·¤¿¡£¾¯¤·¤·¤Æ¤«¤é¤â¤¦°ìÅÙ¼Â¹Ô¤·¤Æ¤ß¤Æ¤¯¤À¤µ¤¤¡£',
                                'error_wrong_type' => '¥¤¥á¡¼¥¸¥Õ¥¡¥¤¥ë¤Ç¤Ï¤¢¤ê¤Þ¤»¤ó',
                                'error_no_dir' => '¥é¥¤¥Ö¥é¥ê¤¬¸«¤Ä¤«¤ê¤Þ¤»¤ó',),
        'image_prop' =>
array('title' => '¥¤¥á¡¼¥¸¤Î¥×¥í¥Ñ¥Æ¥£', 'ok' => '    OK    ',
                  'cancel' => '¥­¥ã¥ó¥»¥ë',                         'source' => '»²¾ÈÀè',
                  'alt' => 'ÂåÂØ¥Æ¥­¥¹¥È',                          'align' => '¹ÔÂ·¤¨',
                  'left' => 'º¸',                                   'right' => '±¦',
                  'top' => '¾å',                                    'middle' => 'Ãæ±û',
                  'bottom' => '²¼',                                 'absmiddle' => 'Ãæ±û(ÀäÂÐÅª)',
                  'texttop' => '¾å(ÀäÂÐÅª)',                        'baseline' => '¥Ù¡¼¥¹¥é¥¤¥ó',
                  'width' => 'Éý',                                  'height' => '¹â¤µ',
                  'border' => '¥Ü¡¼¥À¡¼',                           'hspace' => '²£´Ö³Ö',
                  'vspace' => '½Ä´Ö³Ö',                             'error' => '¥¨¥é¡¼',
                  'error_width_nan' => 'Éý¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',        'error_height_nan' => '¹â¤µ¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                  'error_border_nan' => '¥Ü¡¼¥À¡¼¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤', 'error_hspace_nan' => '²£´Ö³Ö¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                  'error_vspace_nan' => '½Ä´Ö³Ö¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',),
        'hr' => array('title' => '¶èÀÚ¤êÀþ'),
        'table_create' => array('title' => '¥Æ¡¼¥Ö¥ë¤ÎºîÀ®'),
        'table_prop' => array('title' => '¥Æ¡¼¥Ö¥ë¤Î¥×¥í¥Ñ¥Æ¥£',
                              'ok' => '    OK    ',
                              'cancel' => '¥­¥ã¥ó¥»¥ë',
                              'rows' => '¹Ô',
                              'columns' => 'Îó',
                              'width' => 'Éý',
                              'height' => '¹â¤µ',
                              'border' => '¥Ü¡¼¥À¡¼',
                              'pixels' => '¥Ô¥¯¥»¥ë',
                              'cellpadding' => '¥»¥ëÆâÍ¾Çò',
                              'cellspacing' => '¥»¥ëÆâ´Ö³Ö',
                              'bg_color' => 'ÇØ·Ê¿§',
                              'error' => '¥¨¥é¡¼',
                              'error_rows_nan' => '¹Ô¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                              'error_columns_nan' => 'Îó¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                              'error_width_nan' => 'Éý¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                              'error_height_nan' => '¹â¤µ¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                              'error_border_nan' => '¥Ü¡¼¥À¡¼¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                              'error_cellpadding_nan' => '¥»¥ëÆâÍ¾Çò¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',
                              'error_cellspacing_nan' => '¥»¥ëÆâ´Ö³Ö¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',),
        'table_cell_prop' =>
array('title' => '¥»¥ë¤Î¥×¥í¥Ñ¥Æ¥£', 'horizontal_align' => '²£Â·¤¨',
                  'vertical_align' => '½ÄÂ·¤¨',              'width' => 'Éý',
                  'height' => '¹â¤µ',                        'css_class' => 'CSS ¥¯¥é¥¹',
                  'no_wrap' => 'ÀÞ¤êÊÖ¤µ¤Ê¤¤',               'bg_color' => 'ÇØ·Ê¿§',
                  'ok' => '    OK    ',                      'cancel' => '¥­¥ã¥ó¥»¥ë',
                  'left' => 'º¸',                            'center' => 'Ãæ±û',
                  'right' => '±¦',                           'top' => '¾å',
                  'middle' => 'Ãæ±û',                        'bottom' => '²¼',
                  'baseline' => '¥Ù¡¼¥¹¥é¥¤¥ó',              'error' => '¥¨¥é¡¼',
                  'error_width_nan' => 'Éý¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤', 'error_height_nan' => '¹â¤µ¤òÆþÎÏ¤·¤Æ²¼¤µ¤¤',),
        'table_row_insert' => array('title' => '¹Ô¤ÎÁÞÆþ'),
        'table_column_insert' => array('title' => 'Îó¤ÎÁÞÆþ'),
        'table_row_delete' => array('title' => '¹Ô¤Îºï½ü'),
        'table_column_delete' => array('title' => 'Îó¤Îºï½ü'),
        'table_cell_merge_right' => array('title' => '±¦¤ÎÎó¤È·ë¹ç'),
        'table_cell_merge_down' => array('title' => '²¼¤Î¹Ô¤È·ë¹ç'),
        'table_cell_split_horizontal' => array('title' => '¹Ô¤òÊ¬³ä'),
        'table_cell_split_vertical' => array('title' => 'Îó¤òÊ¬³ä'),
        'style' => array('title' => '¥¹¥¿¥¤¥ë'),
        'font' => array('title' => '¥Õ¥©¥ó¥È'),
        'fontsize' => array('title' => '¥µ¥¤¥º'),
        'paragraph' => array('title' => 'ÃÊÍî'),
        'bold' => array('title' => 'ÂÀ»ú'),
        'italic' => array('title' => '¼ÐÂÎ'),
        'underline' => array('title' => '²¼Àþ'),
        'ordered_list' => array('title' => 'ÈÖ¹æ¥ê¥¹¥È'),
        'bulleted_list' => array('title' => '¥ê¥¹¥È'),
        'indent' => array('title' => '¥¤¥ó¥Ç¥ó¥ÈÄÉ²Ã'),
        'unindent' => array('title' => '¥¤¥ó¥Ç¥ó¥Èºï½ü'),
        'left' => array('title' => 'º¸Â·¤¨'),
        'center' => array('title' => 'Ãæ±ûÂ·¤¨'),
        'right' => array('title' => '±¦Â·¤¨'),
        'fore_color' => array('title' => 'Ê¸»ú¿§'),
        'bg_color' => array('title' => 'ÇØ·Ê¿§'),
        'design_tab' => array('title' => 'WYSIWYG (¥Ç¥¶¥¤¥ó) ¥â¡¼¥É¤Ø'),
        'html_tab' => array('title' => 'HTML (¥³¡¼¥É) ¥â¡¼¥É¤Ø'),
        'colorpicker' => array('title' => 'Color picker', 'ok' => '    OK   ', 'cancel' => '¥­¥ã¥ó¥»¥ë',),
        'cleanup' => array('title' => 'HTML¥¯¥ê¡¼¥ó¥¢¥Ã¥× (¥¹¥¿¥¤¥ë¤Îºï½ü)',
                           'confirm' =>
                         '¼Â¹Ô¤¹¤ë¤È¡¢¤¹¤Ù¤Æ¤Î¥¹¥¿¥¤¥ë¤ä¥Õ¥©¥ó¥È¤ä½ÅÊ£¤·¤¿¥¿¥°¤ò½üµî¤·¤Þ¤¹¡£¾ì¹ç¤Ë¤è¤Ã¤Æ¤Ï¤¢¤Ê¤¿¤Î°Õ¿Þ¤·¤Ê¤¤·ë²Ì¤Ë¤Ê¤ë¤³¤È¤â¤¢¤ê¤Þ¤¹¤Î¤Ç¤ªµ¤¤òÉÕ¤±²¼¤µ¤¤¡£',
                           'ok' => '    OK    ',
                           'cancel' => '¥­¥ã¥ó¥»¥ë',),
        'toggle_borders' => array('title' => '¥Ü¡¼¥À¡¼¤ÎÀÚ¤êÂØ¤¨',),
        'hyperlink' =>
array('title' => '¥Ï¥¤¥Ñ¡¼¥ê¥ó¥¯', 'url' => 'URL', 'name' => '¥µ¥¤¥ÈÌ¾', 'target' => '¥¿¡¼¥²¥Ã¥È',
                  'title_attr' => '¥¿¥¤¥È¥ë',  'ok' => '    OK    ', 'cancel' => '¥­¥ã¥ó¥»¥ë',),
        'table_row_prop' =>
array('title' => '¹Ô¤Î¥×¥í¥Ñ¥Æ¥£', 'horizontal_align' => '²£Â·¤¨', 'vertical_align' => '½ÄÂ·¤¨',
                  'css_class' => 'CSS ¥¯¥é¥¹', 'no_wrap' => 'ÀÞ¤êÊÖ¤µ¤Ê¤¤',    'bg_color' => 'ÇØ·Ê¿§',
                  'ok' => '    OK    ',        'cancel' => '¥­¥ã¥ó¥»¥ë',       'left' => 'º¸',
                  'center' => 'Ãæ±û',          'right' => '±¦',                'top' => '¾å',
                  'middle' => 'Ãæ±û',          'bottom' => '²¼',               'baseline' => '¥Ù¡¼¥¹¥é¥¤¥ó',),
        'symbols' => array('title' => 'ÆÃ¼ìÊ¸»ú', 'ok' => '    OK    ', 'cancel' => '¥­¥ã¥ó¥»¥ë',),
        'templates' => array('title' => '¥Æ¥ó¥×¥ì¡¼¥È',),
        'page_prop' =>
array('title' => '¥Ú¡¼¥¸¤Î¥×¥í¥Ñ¥Æ¥£', 'title_tag' => '¥¿¥¤¥È¥ë', 'charset' => 'Ê¸»ú¥³¡¼¥É'
                  'background' => 'ÇØ·Ê¥¤¥á¡¼¥¸',  'bgcolor' => 'ÇØ·Ê¿§',         'text' => 'Ê¸»ú¿§',
                  'link' => '¥ê¥ó¥¯¿§',            'vlink' => 'Ë¬ÌäºÑ¤ß¥ê¥ó¥¯¿§', 'alink' => '¥¢¥¯¥Æ¥£¥Ö¥ê¥ó¥¯¿§',
                  'leftmargin' => 'º¸¥Þ¡¼¥¸¥ó',    'topmargin' => '¾å¥Þ¡¼¥¸¥ó',   'css_class' => 'CSS ¥¯¥é¥¹',
                  'ok' => '    OK    ',            'cancel' => '¥­¥ã¥ó¥»¥ë',),
        'preview' => array('title' => '¥×¥ì¥Ó¥å¡¼',),
        'image_popup' => array('title' => '¥¤¥á¡¼¥¸¤Î¥Ý¥Ã¥×¥¢¥Ã¥×',),
        'zoom' => array('title' => '³ÈÂç',),
);
?>
