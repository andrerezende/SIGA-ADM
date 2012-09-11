<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// Hebrew language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Translation to Hebrew: Yaron Gonen (lord_gino@yahoo.com)
// Copyright: Solmetra (c)2003 All rights reserved.
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-03-20
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'windows-1255';

// text direction for the language
$spaw_lang_direction = 'rtl';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array(
  'cut' => array(
    'title' => 'âæåø'
    ),
  'copy' => array(
    'title' => 'äòú÷'
    ),
  'paste' => array(
    'title' => 'äãá÷'
    ),
  'undo' => array(
    'title' => 'áèì'
    ),
  'redo' => array(
    'title' => 'áöò ùåá'
    ),
  'hyperlink' => array(
    'title' => 'äéôø ÷éùåø'
    ),
  'image_insert' => array(
    'title' => 'äëðñ úîåðä',
    'select' => '   áçø   ',
	'delete' => '  îçé÷ä  ', // new 1.0.5
    'cancel' => '   áèì   ',
    'library' => 'ñôøéä',
    'preview' => 'úöåâä î÷ãéîä',
    'images' => 'úîåðåú',
    'upload' => 'äòìä úîåðä',
    'upload_button' => 'äòìä',
    'error' => 'ùâéàä',
    'error_no_image' => 'áçø úîåðä',
    'error_uploading' => 'àøòä ùâéàä áòú äòìàú äúîåðä. àðà ðñä ùåá îàåçø éåúø.',
    'error_wrong_type' => 'ñåâ ÷åáõ úîåðä ùâåé',
    'error_no_dir' => 'äñôøéä àéðä ÷ééîú',
	'error_cant_delete' => 'ùâéàä: äîçé÷ä ðëùìä!', // new 1.0.5
    ),
  'image_prop' => array(
    'title' => 'àôùøåéåú úîåðä',
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
    'source' => 'î÷åø',
    'alt' => 'è÷ñè àìèøðèéáé',
    'align' => 'äöîãä',
    'left' => 'ùîàì',
    'right' => 'éîéï',
    'top' => 'ìîòìä',
    'middle' => 'àîöò',
    'bottom' => 'ìîèä',
    'absmiddle' => 'îøëæ',
    'texttop' => 'texttop',
    'baseline' => 'baseline',
    'width' => 'øåçá',
    'height' => 'âåáä',
    'border' => '÷å âáåì',
    'hspace' => 'îøååç àô÷é',
    'vspace' => 'îøååç àðëé',
    'error' => 'ùâéàä',
    'error_width_nan' => 'äøåçá àéðå îñôø',
    'error_height_nan' => 'äâåáä àéðå îñôø',
    'error_border_nan' => 'äâáåì àéðå îñôø',
    'error_hspace_nan' => 'îøååç àô÷é àéðå îñôø',
    'error_vspace_nan' => 'îøååç àðëé àéðå îñôø',
    ),
  'hr' => array(
    'title' => '÷å àô÷é'
    ),
  'table_create' => array(
    'title' => 'öåø èáìä'
    ),
  'table_prop' => array(
    'title' => 'àôùøåéåú èáìä',
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
    'rows' => 'ùåøåú',
    'columns' => 'òîåãåú',
    'css_class' => 'CSS class', // <=== new 1.0.6
    'width' => 'øåçá',
    'height' => 'âåáä',
    'border' => 'âáåì',
    'pixels' => 'ôé÷ñìéí',
    'cellpadding' => 'ãéôåï úà',
    'cellspacing' => 'øéååç úà',
    'bg_color' => 'öáò ø÷ò',
    'background' => 'úîåðú ø÷ò', // <=== new 1.0.6
    'error' => 'ùâéàä',
    'error_rows_nan' => 'äùåøåú àéðï îñôø',
    'error_columns_nan' => 'äòîåãåú àéðï îñôø',
    'error_width_nan' => 'äøåçá àéðï îñôø',
    'error_height_nan' => 'äâåáä àéðå îñôø',
    'error_border_nan' => 'äâáåì àéðå îñôø',
    'error_cellpadding_nan' => 'ãéôåï äúà àéðå îñôø',
    'error_cellspacing_nan' => 'øéååç äúà àéðå îñôø',
    ),
  'table_cell_prop' => array(
    'title' => 'àôùøåéåú úà',
    'horizontal_align' => 'äöîãä àô÷éú',
    'vertical_align' => 'äöîãä àðëéú',
    'width' => 'øåçá',
    'height' => 'âåáä',
    'css_class' => 'CSS class',
    'no_wrap' => 'ììà ùáéøú ùåøåú',
    'bg_color' => 'öáò ø÷ò',
    'background' => 'úîåðú ø÷ò', // <=== new 1.0.6
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
    'left' => 'ùîàì',
    'center' => 'îøëæ',
    'right' => 'éîéï',
    'top' => 'ìîòìä',
    'middle' => 'àîöò',
    'bottom' => 'ìîèä',
    'baseline' => '÷å äúçìä',
    'error' => 'ùâéàä',
    'error_width_nan' => 'äøåçá àéðå îñôø',
    'error_height_nan' => 'âåáä àéðå îñôø',

    ),
  'table_row_insert' => array(
    'title' => 'äëðñ øùåîä'
    ),
  'table_column_insert' => array(
    'title' => 'äëðñ òîåãä'
    ),
  'table_row_delete' => array(
    'title' => 'îç÷ øùåîä'
    ),
  'table_column_delete' => array(
    'title' => 'îç÷ òîåãä'
    ),
  'table_cell_merge_right' => array(
    'title' => 'îæâ úàéí éîéðä'
    ),
  'table_cell_merge_down' => array(
    'title' => 'îæâ úàéí ìîèä'
    ),
  'table_cell_split_horizontal' => array(
    'title' => 'ôöì úà àô÷éú'
    ),
  'table_cell_split_vertical' => array(
    'title' => 'ôöì úà àðëéú'
    ),
  'style' => array(
    'title' => 'ñâðåï'
    ),
  'font' => array(
    'title' => 'âåôï'
    ),
  'fontsize' => array(
    'title' => 'âåãì'
    ),
  'paragraph' => array(
    'title' => 'ôéñ÷ä'
    ),
  'bold' => array(
    'title' => 'îåãâù'
    ),
  'italic' => array(
    'title' => 'ðèåé'
    ),
  'underline' => array(
    'title' => '÷å úçúé'
    ),
  'ordered_list' => array(
    'title' => 'øùéîä îîåñôøú'
    ),
  'bulleted_list' => array(
    'title' => 'øùéîä'
    ),
  'indent' => array(
    'title' => 'äëðñ ôðéîä'
    ),
  'unindent' => array(
    'title' => 'äåöà'
    ),
  'left' => array(
    'title' => 'ùîàì'
    ),
  'center' => array(
    'title' => 'îøëæ'
    ),
  'right' => array(
    'title' => 'éîéï'
    ),
  'fore_color' => array(
    'title' => 'öáò ÷ãîé'
    ),
  'bg_color' => array(
    'title' => 'öáò ø÷ò'
    ),
  'design_tab' => array(
    'title' => 'òéöåá äîñîê'
    ),
  'html_tab' => array(
    'title' => 'òøåê ÷åã Html'
    ),
  'colorpicker' => array(
    'title' => 'áçø öáò',
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
    ),
    // <<<<<<<<< NEW >>>>>>>>>
  'cleanup' => array(
    'title' => 'ðé÷åé Html (äñø ñâðåðåú)',
    'confirm' => 'áéöåò ôòåìä æå éñéø àú ëì äñâðåðåú, âåôðéí åëì äúàâéí äìà ùéîåùééí îîñîê æä. çì÷ àå ëì äòéöåáéí éàáãå.',
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
    ),
  'toggle_borders' => array(
    'title' => 'çéæå÷ âáåìåú',
    ),
  'hyperlink' => array(
    'title' => 'äéôø ÷éùåø',
    'url' => 'URL',
    'name' => 'ùí',
    'target' => 'îèøä',
    'title_attr' => 'ëåúøú',
	'a_type' => 'ñåâ', // <=== new 1.0.6
	'type_link' => '÷éùåø', // <=== new 1.0.6
	'type_anchor' => 'òåâï', // <=== new 1.0.6
	'type_link2anchor' => '÷éùåø ìòåâï', // <=== new 1.0.6
	'anchors' => 'òåâðéí', // <=== new 1.0.6
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
    ),
  'hyperlink_targets' => array( // <=== new 1.0.5
  	'_self' => 'äçìåï òöîå (_self)',
	'_blank' => 'çìåï çãù (_blank)',
	'_top' => 'ôøééí òìéåï (_top)',
	'_parent' => 'ôøééí àá (_parent)'
	),
  'table_row_prop' => array(
    'title' => 'úëåðåú ùåøä',
    'horizontal_align' => 'äöîãä àåô÷éú',
    'vertical_align' => 'äöîãä àðëéú',
    'css_class' => 'CSS class',
    'no_wrap' => 'ììà ùáéøú ùåøåú',
    'bg_color' => 'öáò ø÷ò',
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
    'left' => 'ùîàì',
    'center' => 'îøëæ',
    'right' => 'éîéï',
    'top' => 'ìîòìä',
    'middle' => 'àîöò',
    'bottom' => 'ìîèä',
    'baseline' => '÷å äúçìä',
	),
  'symbols' => array(
    'title' => 'úååéí îéåçãéí',
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
	),
  'templates' => array(
    'title' => 'úáðéåú',
	),
  'page_prop' => array(
    'title' => 'úëåðåú ãó',
    'title_tag' => 'ëåúøú',
    'charset' => 'Charset',
    'background' => 'úîåðú ø÷ò',
    'bgcolor' => 'öáò ø÷ò',
    'text' => 'öáò è÷ñè',
    'link' => 'öáò ÷éùåø',
    'vlink' => 'öáò ÷éùåø ùäéå áå ëáø',
    'alink' => 'öáò ÷éùåø ôòéì',
    'leftmargin' => 'ùåìééí ùîàìééí',
    'topmargin' => 'ùåìééí òìéåðéí',
    'css_class' => 'CSS class',
    'ok' => '  àå÷é  ',
    'cancel' => '  áèì  ',
	),
  'preview' => array(
    'title' => 'úöåâä î÷ãéîä',
	),
  'image_popup' => array(
    'title' => 'úîåðä ÷åôöú',
	),
  'zoom' => array(
    'title' => 'æåí',
	),
	);
	?>

