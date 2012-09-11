<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// English language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Copyright: Solmetra (c)2003 All rights reserved.
// Greek translation: Saxinidis B. Konstantinos
//                    skva@in.gr
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-03-20
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'iso-8859-7';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array(
  'cut' => array(
    'title' => 'ÁðïêïðÞ'
    ),
  'copy' => array(
    'title' => 'ÁíôéãñáöÞ'
    ),
  'paste' => array(
    'title' => 'Åðéêüëëçóç'
    ),
  'undo' => array(
    'title' => 'Áíáßñåóç'
    ),
  'redo' => array(
    'title' => 'Áêýñùóç Áíáßñåóçò'
    ),
  'hyperlink' => array(
    'title' => 'Õðåñóýíäåóç'
    ),
  'image_insert' => array(
    'title' => 'ÅéóáãùãÞ åéêüíáò',
    'select' => 'ÅðéëïãÞ',
    'cancel' => '¢êõñï',
    'library' => 'ÂéâëéïèÞêç',
    'preview' => 'Ðñïåðéóêüðçóç',
    'images' => 'Åéêüíåò',
    'upload' => 'Öüñôùìá åéêüíáò',
    'upload_button' => 'Öüñôùìá',
    'error' => 'ËÜèïò',
    'error_no_image' => 'Ðáñáêáëþ åðéëÝîôå ìéá åéêüíá',
    'error_uploading' => '¸íá ëÜèïò åíþ ôï äéá÷åéñéæüìåíï áñ÷åßï öïñôþíïíôáí.  Ðáñáêáëþ ðñïóðáèÞóôå ðÜëé áñãüôåñá',
    'error_wrong_type' => 'ËáíèáóìÝíïò ôýðïò áñ÷åßïõ åéêüíáò',
    'error_no_dir' => 'Ç âéâëéïèÞêç äåí äçìéïõñãÞèçêå ìå öõóéêü ôñïðï Þ äåí õðÜñ÷åé',
    ),
  'image_prop' => array(
    'title' => 'Éäéüôçôåò åéêüíáò',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    'source' => 'ÐñïÝëåõóç',
    'alt' => 'Åíáëëáêôéêü êåßìåíï',
    'align' => 'Åõèõãñáììßóç',
    'left' => 'áñéóôåñÜ',
    'right' => 'äåîéÜ',
    'full' => 'justify',
    'top' => 'ðÜíù',
    'middle' => 'ìÝóç',
    'bottom' => 'êÜôù',
    'absmiddle' => 'absìÝóç',
    'texttop' => 'texttop',
    'baseline' => 'baseline',
    'width' => 'ÐëÜôïò',
    'height' => '¾øïò',
    'border' => 'Ðåñßãñáììá',
    'hspace' => 'Ïñéæ. space',
    'vspace' => 'ÊÜèåô. space',
    'error' => 'ËÜèïò',
    'error_width_nan' => 'Ôï ðëÜôïò äåí åßíáé Ýíáò áñéèìüò',
    'error_height_nan' => '¾øïò äåí åßíáé Ýíáò áñéèìüò',
    'error_border_nan' => 'Border äåí åßíáé Ýíáò áñéèìüò',
    'error_hspace_nan' => 'Ôï ïñéæüíôéï äéÜóôçìá äåí åßíáé Ýíáò áñéèìüò',
    'error_vspace_nan' => 'Ôï êÜèåôï äéÜóôçìá äåí åßíáé Ýíáò áñéèìüò',
    ),
  'hr' => array(
    'title' => 'Ïñéæüíôéïò êáíüíáò'
    ),
  'table_create' => array(
    'title' => 'ÄçìéïõñãÞóôå ðßíáêá'
    ),
  'table_prop' => array(
    'title' => 'Éäéüôçôåò ðßíáêá',
    'ok' => '   OK   ',
    'cancel' => 'Áêõñï',
    'rows' => 'ÓåéñÝò',
    'columns' => 'ÓôÞëåò',
    'width' => 'ÐëÜôïò',
    'height' => '¾øïò',
    'border' => 'Ðåñßãñáììá',
    'pixels' => 'pixels',
    'cellpadding' => 'ÃÝìéóìá êåëéïý',
    'cellspacing' => 'ÄéÜóôçìá êåëéïý',
    'bg_color' => 'Background ÷ñþìá',
    'error' => 'ËÜèïò',
    'error_rows_nan' => 'Ïé óåéñÝò äåí åßíáé Ýíáò áñéèìüò',
    'error_columns_nan' => 'Ïé óôÞëåò äåí åßíáé Ýíáò áñéèìüò',
    'error_width_nan' => 'Ôï ðëÜôïò äåí åßíáé Ýíáò áñéèìüò',
    'error_height_nan' => '¾øïò äåí åßíáé Ýíáò áñéèìüò',
    'error_border_nan' => 'Ôï ðåñßãñáììá äåí åßíáé Ýíáò áñéèìüò',
    'error_cellpadding_nan' => 'Ôï ãÝìéóìá êåëéïý äåí åßíáé Ýíáò áñéèìüò',
    'error_cellspacing_nan' => 'Ôï äéÜóôçìá êåëéïý äåí åßíáé Ýíáò áñéèìüò',
    ),
  'table_cell_prop' => array(
    'title' => ' éäéüôçôåò Óôçëþí',
    'horizontal_align' => 'Ïñéæüíôéá åõèõãñÜììéóç',
    'vertical_align' => 'ÊÜèåôç åõèõãñÜììéóç',
    'width' => 'ÐëÜôïò',
    'height' => '¾øïò',
    'css_class' => 'CSS class',
    'no_wrap' => 'No wrap',
    'bg_color' => 'Background color',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    'left' => 'ÁñéóôåñÜ',
    'center' => 'ÊÝíôñï',
    'right' => 'ÄåîéÜ',
    'full' => 'Justify',
    'top' => 'Top',
    'middle' => 'Middle',
    'bottom' => 'Bottom',
    'baseline' => 'Baseline',
    'error' => 'ËÜèïò',
    'error_width_nan' => 'Ôï ðëÜôïò äåí åßíáé Ýíáò áñéèìüò',
    'error_height_nan' => '¾øïò äåí åßíáé Ýíáò áñéèìüò',
    ),
  'table_row_insert' => array(
    'title' => 'ÅéóáãùãÞ óåéñÜò'
    ),
  'table_column_insert' => array(
    'title' => 'ÅéóáãùãÞ óôÞëçò'
    ),
  'table_row_delete' => array(
    'title' => 'ÄéáãñáöÞ óåéñÜò'
    ),
  'table_column_delete' => array(
    'title' => 'ÄéáãñáöÞ óôÞëçò'
    ),
  'table_cell_merge_right' => array(
    'title' => 'Merge äåîéÜ'
    ),
  'table_cell_merge_down' => array(
    'title' => 'Merge êÜôù'
    ),
  'table_cell_split_horizontal' => array(
    'title' => 'Split êåëéïý ïñéæüíôéá'
    ),
  'table_cell_split_vertical' => array(
    'title' => 'Split êåëéïý êÜèåôá'
    ),
  'style' => array(
    'title' => 'Style'
    ),
  'font' => array(
    'title' => 'ÃñáììáôïóåéñÜ'
    ),
  'fontsize' => array(
    'title' => 'ÌÝãåèïò'
    ),
  'paragraph' => array(
    'title' => 'ÐáñÜãñáöïò'
    ),
  'bold' => array(
    'title' => '¸íôïíá'
    ),
  'italic' => array(
    'title' => 'Italic'
    ),
  'underline' => array(
    'title' => 'ÕðïãñÜììéóç'
    ),
  'ordered_list' => array(
    'title' => 'Áñßèìçóç'
    ),
  'bulleted_list' => array(
    'title' => 'êïõêêßäåò'
    ),
  'indent' => array(
    'title' => 'Åóï÷Þ'
    ),
  'unindent' => array(
    'title' => '×ùñßò åóï÷Þ'
    ),
  'left' => array(
    'title' => 'ÁñéóôåñÜ'
    ),
  'center' => array(
    'title' => 'ÊÝíôñï'
    ),
  'right' => array(
    'title' => 'ÄåîéÜ'
    ),
  'full' => array(
    'title' => 'Justify'
    ),
  'fore_color' => array(
    'title' => 'Fore color'
    ),
  'bg_color' => array(
    'title' => 'Background color'
    ),
  'design_tab' => array(
    'title' => 'ÁëëáãÞ óå WYSIWYG (design) mode'
    ),
  'html_tab' => array(
    'title' => 'ÁëëáãÞ óå HTML (code) mode'
    ),
  'colorpicker' => array(
    'title' => 'Color picker',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    ),
  'cleanup' => array(
    'title' => 'HTML êáèáñéóìüò (áðïìÜêñõíóç styles)',
    'confirm' => 'Ç åêôÝëåóç áõôÞ èá áöáéñÝóåé üëá ôá styles, fonts and useless tags áðü ôï óõãêåêñéìÝíï content. ÊÜðïéá Þ êáé üëåò ïé  ìïñöïðïéÞóåéò óïõ ìðïñåß íá ÷áèïýí.',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    ),
  'toggle_borders' => array(
    'title' => '¼ñéá ðåñéãñáììÜôùí',
    ),
  'hyperlink' => array(
    'title' => 'Õðåñóýíäåóç',
    'url' => 'URL',
    'name' => '¼íïìá',
    'target' => '¼ñéá',
    'title_attr' => 'Ôßôëïò',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    ),
  'table_row_prop' => array(
    'title' => 'Éäéüôçôåò Óåéñþí',
    'horizontal_align' => 'Ïñéæüíôéá åõèõãñÜììéóç',
    'vertical_align' => 'ÊÜèåôç åõèõãñÜììéóç',
    'css_class' => 'CSS class',
    'no_wrap' => 'No wrap',
    'bg_color' => 'Background color',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    'left' => 'ÁñéóôåñÜ',
    'center' => 'ÊÝíôñï',
    'right' => 'ÄåîéÜ',
    'full' => 'Justify',
    'top' => 'ÐÜíù',
    'middle' => 'ÌÝóç',
    'bottom' => 'ÊÜôù',
    'baseline' => 'Baseline',
    ),
  'symbols' => array(
    'title' => 'Óðåóéáë ÷áñáêôÞñåò',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    ),
  'templates' => array(
    'title' => 'Templates',
    ),
  'page_prop' => array(
    'title' => 'Éäéüôçôåò Óåëßäáò',
    'title_tag' => 'Ôßôëïò',
    'charset' => 'Charset',
    'background' => 'Background åéêüíá',
    'bgcolor' => 'Background ÷ñþìá',
    'text' => '×ñþìá êåéìÝíïõ',
    'link' => '×ñþìá link',
    'vlink' => '×ñþìá link ðïõ åðéóêÝöôçêáí',
    'alink' => '×ñþìá Åíåñãïý link ',
    'leftmargin' => 'Ðåñéèþñéï Áñéóôåñü',
    'topmargin' => 'ÐÜíù Ðåñéèþñéï',
    'css_class' => 'CSS class',
    'ok' => '   OK   ',
    'cancel' => '¢êõñï',
    ),
  'preview' => array(
    'title' => 'Ðñïåðéóêüðçóç',
    ),
  'image_popup' => array(
    'title' => 'Image popup',
    ),
  'zoom' => array(
    'title' => 'Zoom',
    ),
    );
    ?>