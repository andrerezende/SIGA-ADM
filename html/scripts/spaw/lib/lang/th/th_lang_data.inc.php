<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// English language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Copyright: Solmetra (c)2003 All rights reserved.
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-03-20
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'windows-874';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array(
  'cut' => array(
    'title' => 'µÑ´'
    ),
  'copy' => array(
    'title' => '¤Ñ´ÅÍ¡'
    ),
  'paste' => array(
    'title' => 'ÇÒ§'
    ),
  'undo' => array(
    'title' => 'àÅÔ¡·Ó'
    ),
  'redo' => array(
    'title' => '·Ó«éÓ'
    ),
  'image_insert' => array(
    'title' => 'á·Ã¡ÃÙ»',
    'select' => 'àÅ×Í¡',
	'delete' => 'Åº', // new 1.0.5
    'cancel' => 'Â¡àÅÔ¡',
    'library' => 'äÅºÃÒÅÕè',
    'preview' => 'áÊ´§µÑÇÍÂèÒ§',
    'images' => 'ÃÙ»ÀÒ¾',
    'upload' => 'ÍÑ¾âËÅ´ÀÒ¾',
    'upload_button' => 'ÍÑ¾âËÅ´',
    'error' => '¼Ô´¾ÅÒ´!',
    'error_no_image' => 'â»Ã´·Ó¡ÒÃàÅ×Í¡ÀÒ¾',
    'error_uploading' => '¡ÒÃ¤ÇÒÁ¼Ô´¾ÅÒ´¢Öé¹ÃÐËÇèÒ§·Ó¡ÒÃÍÑ¾âËÅ´ä¿Åì. ÅÍ§ãËÁèÍÕ¡¤ÃÑé§',
    'error_wrong_type' => 'ÃÙ»áººä¿Åì¼Ô´',
    'error_no_dir' => 'äÁè¾ºäÅºÃÒÃÕ'
	'error_cant_delete' => '¡ÒÃÅºÅéÁàËÅÇ', // new 1.0.5
    ),
  'image_prop' => array(
    'title' => '¤Ø³ÊÁºÑµÔÃÙ»ÀÒ¾',
    'ok' => '   µ¡Å§   ',
    'cancel' => 'Â¡àÅÔ¡',
    'source' => 'áËÅè§¢éÍÁÙÅ',
    'alt' => '¢éÍ¤ÇÒÁ·Ò§àÅ×Í¡',
    'align' => '¡ÒÃ¨Ñ´µÓáË¹è§¢éÍ¤ÇÒÁ',
    'left' => 'ªÔ´«éÒÂ',
    'right' => 'ªÔ´¢ÇÒ',
    'top' => 'ªÔ´º¹ÊØ´',
    'middle' => '¡Öè§¡ÅÒ§',
    'bottom' => 'ªÔ´ÅèÒ§',
    'absmiddle' => 'ÍÂÙè¡Öè§¡ÅÒ§¾Í´Õ',
    'texttop' => 'texttop',
    'baseline' => 'baseline',
    'width' => '¤ÇÒÁ¡ÇéÒ§',
    'height' => '¤ÇÒÁÊÙ§',
    'border' => '¤ÇÒÁË¹Ò¢Íº',
    'hspace' => 'ªèÍ§ÇèÒ§á¹Ç¹Í¹',
    'vspace' => 'ªèÍ§ÇèÒ§á¹ÇµÑé§',
    'error' => '¼Ô´¾ÅÒ´!',
    'error_width_nan' => '¤ÇÒÁ¡ÇéÒ§·ÕèãÊèäÁèãªè¤èÒµÑÇàÅ¢',
    'error_height_nan' => '¤ÇÒÁÊÙ§·ÕèãÊèäÁèãªè¤èÒµÑÇàÅ¢',
    'error_border_nan' => '¤ÇÒÁË¹Ò¢Íº·ÕèãÊèäÁèãªè¤èÒµÑÇàÅ¢',
    'error_hspace_nan' => 'ªèÍ§ÇèÒ§á¹Ç¹Í¹·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_vspace_nan' => 'ªèÍ§ÇèÒ§á¹ÇµÑé§·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    ),
  'hr' => array(
    'title' => 'àÊé¹áºè§ºÃÃ·Ñ´'
    ),
  'table_create' => array(
    'title' => 'ÊÃéÒ§µÒÃÒ§'
    ),
  'table_prop' => array(
    'title' => '¤Ø³ÊÁºÑµÔµÒÃÒ§',
    'ok' => '   µ¡Å§   ',
    'cancel' => 'Â¡àÅÔ¡',
    'rows' => 'á¶Ç',
    'columns' => '¤ÍÅÑÁÀì',
    'css_class' => 'CSS ¤ÅÒÊ', // <=== new 1.0.6
    'width' => '¤ÇÒÁ¡ÇéÒ§',
    'height' => '¤ÇÒÁÊÙ§',
    'border' => '¤ÇÒÁË¹Ò¢Íº',
    'pixels' => '¾Ô¡à«Å',
    'cellpadding' => 'Cell padding',
    'cellspacing' => 'Cell spacing',
    'bg_color' => 'ÊÕ¾×é¹ËÅÑ§',
    'background' => 'ÀÒ¾¾×é¹ËÅÑ§', // <=== new 1.0.6
    'error' => '¼Ô´¾ÅÒ´!',
    'error_rows_nan' => '¤èÒá¶Ç·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_columns_nan' => '¤èÒ¤ÍÅÑÁÀì·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_width_nan' => '¤èÒ¤ÇÒÁ¡ÇéÒ§·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_height_nan' => '¤èÒ¤ÇÒÁÊÙ§·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_border_nan' => '¤èÒ¤ÇÒÁË¹Ò¢Íº·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_cellpadding_nan' => 'Cell padding ·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_cellspacing_nan' => 'Cell spacing ·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    ),
  'table_cell_prop' => array(
    'title' => '¤Ø³ÊÁºÑµÔà«ÅÅì',
    'horizontal_align' => '¡ÒÃ¨Ñ´á¹Ç¹Í¹',
    'vertical_align' => '¡ÒÃ¨Ñ´á¹ÇµÖé§',
    'width' => '¤ÇÒÁ¡ÇéÒ§',
    'height' => '¤ÇÒÁÊÙ§',
    'css_class' => 'CSS ¤ÅÒÊ',
    'no_wrap' => 'äÁèÅéÍÁ¢éÍ¤ÇÒÁ',
    'bg_color' => 'ÊÕ¾×é¹ËÅÑ§',
    'background' => 'ÀÒ¾¾×é¹ËÅÑ§', // <=== new 1.0.6
    'ok' => '   µ¡Å§   ',
    'cancel' => 'Â¡àÅÔ¡',
    'left' => 'ªÔ´«éÒÂ',
    'center' => '¨Ñ´¡ÅÒ§',
    'right' => 'ªÔ´¢ÇÒ',
    'top' => 'ªÔ´º¹',
    'middle' => '¨Ñ´¡ÅÒ§',
    'bottom' => 'ªÔ´ÅèÒ§',
    'baseline' => 'Baseline',
    'error' => '¼Ô´¾ÅÒ´!',
    'error_width_nan' => '¤èÒ¤ÇÒÁ¡ÇéÒ§·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    'error_height_nan' => '¤èÒ¤ÇÒÁÊÙ§·ÕèãÊèäÁèãª¤èÒµÑÇàÅ¢',
    ),
  'table_row_insert' => array(
    'title' => 'á·Ã¡á¶Ç'
    ),
  'table_column_insert' => array(
    'title' => 'á·Ã¡¤ÍÅÑÁÀì'
    ),
  'table_row_delete' => array(
    'title' => 'Åºá¶Ç'
    ),
  'table_column_delete' => array(
    'title' => 'Åº¤ÍÅÑÁÀì'
    ),
  'table_cell_merge_right' => array(
    'title' => 'ÃÇÁà«ÅÅì·Ò§´éÒ¹¢ÇÒ'
    ),
  'table_cell_merge_down' => array(
    'title' => 'ÃÇÁà«ÅÅì´éÒ¹«éÒÂ'
    ),
  'table_cell_split_horizontal' => array(
    'title' => 'áºè§à«ÅÅì·Ò§á¹Ç¹Í¹'
    ),
  'table_cell_split_vertical' => array(
    'title' => 'áºè§à«ÅÅì·Ò§á¹ÇµÑé§'
    ),
  'style' => array(
    'title' => 'ÊäµÅì'
    ),
  'font' => array(
    'title' => 'ÃÙ»áººÍÑ¡ÉÃ'
    ),
  'fontsize' => array(
    'title' => '¢¹Ò´'
    ),
  'paragraph' => array(
    'title' => 'ÂèÍË¹éÒ'
    ),
  'bold' => array(
    'title' => 'µÑÇË¹Ò'
    ),
  'italic' => array(
    'title' => 'µÑÇàÍÕÂ§'
    ),
  'underline' => array(
    'title' => '¢Õ´àÊé¹ãµé'
    ),
  'ordered_list' => array(
    'title' => 'ÊÑ­ÅÑ¡É³ìËÑÇ¢éÍÂèÍÂàÃÕÂ§ÅÓ´éº'
    ),
  'bulleted_list' => array(
    'title' => 'ÊÑ­ÅÑ¡É³ìËÑÇ¢éÍÂèÍÂ'
    ),
  'indent' => array(
    'title' => 'ÍÔ¹à´ç¹·ì'
    ),
  'unindent' => array(
    'title' => 'ÍÑ¹ÍÔ¹à´ç¹·ì'
    ),
  'left' => array(
    'title' => '«éÒÂ'
    ),
  'center' => array(
    'title' => '¡ÅÒ§'
    ),
  'right' => array(
    'title' => '¢ÇÒ'
    ),
  'fore_color' => array(
    'title' => 'ÊÕ¾×é¹Ë¹éÒ'
    ),
  'bg_color' => array(
    'title' => 'ÊÕ¾×é¹ËÅÑ§'
    ),
  'design_tab' => array(
    'title' => 'ÊÅÑºÊÙèâËÁ´ WYSIWYG (ÍÍ¡áºº) '
    ),
  'html_tab' => array(
    'title' => 'ÊÅÑºÊÙèâËÁ´ HTML (â¤é´) '
    ),
  'colorpicker' => array(
    'title' => '¨Ò¹ÊÕ',
    'ok' => '   µ¡Å§   ',
    'cancel' => 'Â¡àÅÔ¡',
    ),
  'cleanup' => array(
    'title' => 'HTML cleanup (Â¡àÅÔ¡ÊäµÅì)',
    'confirm' => '¡ÒÃ¡ÃÐ·Ó¹Õéà»ç¹¡ÒÃÂ¡àÅÔ¡ÒÃãªé§Ò¹ÊäµÅì, ÃÙ»áººÍÑ¡ÉÃáÅÐ¤ÓÊÑè§ºÒ§ÍÑ¹·ÕèÁÕ¼Å¡Ñºº·¤ÇÒÁ¹Õé¨ÐËÒÂä».',
    'ok' => '   µ¡Å§  ',
    'cancel' => 'Â¡àÅÔ¡',
    ),
  'toggle_borders' => array(
    'title' => 'ÊÅÑº¤ÇÒÁË¹Ò¢Íº',
    ),
  'hyperlink' => array(
    'title' => 'äÎà»ÍÃìÅÔ§¤ì',
    'url' => 'URL',
    'name' => 'ª×èÍ',
    'target' => 'à»éÒËÁÒÂ',
    'title_attr' => 'ËÑÇàÃ×èÍ§',
	'a_type' => 'ÃÙ»áºº', // <=== new 1.0.6
	'type_link' => 'ÅÔ§¤ì', // <=== new 1.0.6
	'type_anchor' => 'ÍÑ§à¤ÍÃìr', // <=== new 1.0.6
	'type_link2anchor' => 'ÅÔ§¤ìä»ÂÑ§ÍÑ§à¤ÍÃì', // <=== new 1.0.6
	'anchors' => 'ÍÑ§à¤ÍÃì', // <=== new 1.0.6
    'ok' => '   µ¡Å§   ',
    'cancel' => 'Â¡àÅÔ¡',
    ),
  'hyperlink_targets' => array( // <=== new 1.0.5
  	'_self' => 'à¿ÃÁà´ÕÂÇ¡Ñ¹ (_self)',
	'_blank' => 'Ë¹éÒà»ÅèÒ (_blank)',
	'_top' => 'à¿ÃÁº¹ÊØ´ (_top)',
	'_parent' => 'à¿ÃÁËÅÑ¡ (_parent)'
	),
  'table_row_prop' => array(
    'title' => '¤Ø³ÊÁºÑµÔá¶Ç',
    'horizontal_align' => '¨Ñ´àÃÕÂ§µÒÁá¹Ç¹Í¹',
    'vertical_align' => '¨Ñ´àÃÕÂ§µÒÁá¹ÇµÑé§',
    'css_class' => 'CSS ¤ÅÒÊ',
    'no_wrap' => 'äÁèÅéÍÁ¢éÍ¤ÇÒÁ',
    'bg_color' => 'ÊÕ¾×é¹ËÅÑ§',
    'ok' => '   µ¡Å§  ',
    'cancel' => 'Â¡àÅÔ¡',
    'left' => 'ªÔ´«éÒÂ',
    'center' => '¡Öè§¡ÅÒ§',
    'right' => 'ªÔ´¢ÇÒ',
    'top' => 'ªÔ´º¹',
    'middle' => '¡Öè§¡ÅÒ§',
    'bottom' => 'ªÔ´ÅèÒ§',
    'baseline' => 'Baseline',
	),
  'symbols' => array(
    'title' => 'ÍÑ¡¢ÃÐ¾ÔàÈÉ',
    'ok' => '   µ¡Å§   ',
    'cancel' => 'Â¡àÅÔ¡',
	),
  'templates' => array(
    'title' => 'à·Áà¾Åµ',
	),
  'page_prop' => array(
    'title' => '¤Ø³ÊÁºÑµÔ',
    'title_tag' => 'ËÑÇàÃ×èÍ§',
    'charset' => 'Charset',
    'background' => 'ÀÒ¾¾×é¹ËÅÑ§',
    'bgcolor' => 'ÊÕ¾×é¹ËÅÑ§',
    'text' => 'ÊÕ¢éÍ¤ÇÒÁ',
    'link' => 'ÊÕÅÔ§¤ì'
    'vlink' => 'ÊÕÅÔ§¤ìàÂÕèÂÁ',
    'alink' => 'ÊÕÅÔ§¤ìáÍ¤·Ô¿',
    'leftmargin' => 'ÃÐÂÐ¢Íº«éÒÂ',
    'topmargin' => 'ÃÐÂÐ¢Íºº¹',
    'css_class' => 'CSS ¤ÅÒÊ',
    'ok' => '   µ¡Å§  ',
    'cancel' => 'Â¡àÅÔ¡',
	),
  'preview' => array(
    'title' => 'áÊ´§µÑÇÍÂèÒ§',
	),
  'image_popup' => array(
    'title' => '»êÍºÍÑ¾ÃÙ»',
	),
  'zoom' => array(
    'title' => '¢ÂÒÂ',
	),
	);
	?>