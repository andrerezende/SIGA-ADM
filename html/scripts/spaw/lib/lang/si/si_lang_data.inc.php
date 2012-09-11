<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// Slovenian language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Copyright: Solmetra (c)2003 All rights reserved.
// Sloveniain translation: Vladimir Ota
//                         lado@prim-nov.si
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-03-20
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'windows-1250';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array
(
        'cut' => array('title' => 'Odre�i'),
        'copy' => array('title' => 'Kopiraj'),
        'paste' => array('title' => 'Prilepi'),
        'undo' => array('title' => 'Razveljavi'),
        'redo' => array('title' => 'Ponovno uveljavi'),
        'hyperlink' => array('title' => 'Povezava'),
        'image_insert' => array('title' => 'Vrini sliko', 'select' => 'Izberi', 'cancel' => 'Prekini', 'library' => 'Knji�njica', 'preview' => 'Predogled', 'images' => 'Slike', 'upload' => 'Po�lji sliko', 'upload_button' => 'Po�lji', 'error' => 'Napaka', 'error_no_image' => 'Izberite sliko, prosim', 'error_uploading' => 'Napaka pri po�iljanju datoteke. Poskusite ponovno', 'error_wrong_type' => 'Napa�na vrsta datoteke s sliko', 'error_no_dir' => 'Knji�njica ne obstaja / ni dostopna',),
        'image_prop' => array('title' => 'Lastnosti slike', 'ok' => '   OK   ', 'cancel' => 'Prekini', 'source' => 'Source', 'alt' => 'Alternativno besedilo', 'align' => 'Poravnaj', 'left' => 'levo', 'right' => 'desno', 'top' => 'zgoraj', 'middle' => 'na sredino', 'bottom' => 'spodaj', 'absmiddle' => 'absolutno sredino', 'texttop' => 'na vrh teksta', 'baseline' => 'baseline', 'width' => '�irina', 'height' => 'Vi�ina', 'border' => 'Obroba', 'hspace' => 'Horiz. razmik', 'vspace' => 'Vert. razmik', 'error' => 'Napaka', 'error_width_nan' => '�irina mora biti podana s �tevilom', 'error_height_nan' => 'Vi�ina mora biti podana s �tevilom', 'error_border_nan' => 'Obroba mora biti podana s �tevilom', 'error_hspace_nan' => 'Horiz. razmik mora biti podan s �tevilom', 'error_vspace_nan' => 'Vert. razmik mora biti podan �tevilom',),
        'hr' => array('title' => 'Horizontalna �rta'),
        'table_create' => array('title' => 'Naredi tabelo'),
        'table_prop' => array('title' => 'Lastnosti tabele', 'ok' => '   OK   ', 'cancel' => 'Prekini', 'rows' => 'Vrstic', 'columns' => 'Kolon', 'width' => '�irina', 'height' => 'Vi�ina', 'border' => 'Debelina obrobe', 'pixels' => 'pixlov', 'cellpadding' => 'Debelina obloge celic', 'cellspacing' => 'Razmik med celicami', 'bg_color' => 'Barva ozadja', 'error' => 'Napaka', 'error_rows_nan' => '�tevilo vrstic mora biti podano s �tevilom', 'error_columns_nan' => '�tevilo kolon mora biti podano s �tevilom', 'error_width_nan' => '�irina mora biti podana s �tevilom', 'error_height_nan' => 'Vi�ina mora biti podana s �tevilom', 'error_border_nan' => 'Debelina obrobe mora biti podana s �tevilom', 'error_cellpadding_nan' => 'Debelina obloge celic mora biti podana s �tevilom', 'error_cellspacing_nan' => 'Razmik med celicami mora biti podan s �tevilom',),
        'table_cell_prop' => array('title' => 'Lastnosti celic', 'horizontal_align' => 'Horiz. poravnava', 'vertical_align' => 'Vert. poravnava', 'width' => '�irina', 'height' => 'Vi�ina', 'css_class' => 'CSS class', 'no_wrap' => 'Brez preloma (wrap)', 'bg_color' => 'Barva ozadja', 'ok' => '   OK   ', 'cancel' => 'Prekini', 'left' => 'Levo', 'center' => 'Center', 'right' => 'Desno', 'top' => 'Zgoraj', 'middle' => 'Sredina', 'bottom' => 'Spodaj', 'baseline' => 'Baseline', 'error' => 'Napaka', 'error_width_nan' => 'Vi�ina mora biti podana s �tevilom', 'error_height_nan' => 'Vi�ina mora biti podana s �tevilom',),
        'table_row_insert' => array('title' => 'Vrini vrstico'),
        'table_column_insert' => array('title' => 'Vrini kolono'),
        'table_row_delete' => array('title' => 'Bri�i vrstico'),
        'table_column_delete' => array('title' => 'Bri�i kolono'),
        'table_cell_merge_right' => array('title' => 'Vrini na desni'),
        'table_cell_merge_down' => array('title' => 'Vrini spodaj'),
        'table_cell_split_horizontal' => array('title' => 'Horizontalno Razdeli celico'),
        'table_cell_split_vertical' => array('title' => 'Vretikalno razdeli celico'),
        'style' => array('title' => 'Stil'),
        'font' => array('title' => 'Font'),
        'fontsize' => array('title' => 'Velikost'),
        'paragraph' => array('title' => 'Odstavek'),
        'bold' => array('title' => 'Krepko'),
        'italic' => array('title' => 'Kurzivno'),
        'underline' => array('title' => 'Pod�rtano'),
        'ordered_list' => array('title' => 'O�tevil�en seznam'),
        'bulleted_list' => array('title' => '"Bulleted" seznam'),
        'indent' => array('title' => 'Odmik'),
        'unindent' => array('title' => 'Izmik'),
        'left' => array('title' => 'Levo'),
        'center' => array('title' => 'Center'),
        'right' => array('title' => 'Desno'),
        'fore_color' => array('title' => 'Barva ospredja'),
        'bg_color' => array('title' => 'Barva ozadjar'),
        'design_tab' => array('title' => 'Preklopi v WYSIWYG (design) na�in dela'),
        'html_tab' => array('title' => 'Preklopi na HTML (koda) na�in dela'),
        'colorpicker' => array('title' => 'Izbira barve', 'ok' => '   OK   ', 'cancel' => 'Prekini',),
        'cleanup' => array('title' => '�i��enje HTML (odstranjevanje stilov)', 'confirm' => 'S tem boste odstranili stile, fonte in neuporabne HTML tage iz trenutnega besedila. Oblika bo deloma ali povsem izgubljena.', 'ok' => '   OK   ', 'cancel' => 'Prekini',),
        'toggle_borders' => array('title' => 'Preklopi obrobe',),
        'hyperlink' => array('title' => 'Povezava', 'url' => 'URL', 'name' => 'Ime', 'target' => 'Tar�a', 'title_attr' => 'Naslov', 'ok' => '   OK   ', 'cancel' => 'Prekini',),
        'table_row_prop' => array('title' => 'Lastnosti vrstic', 'horizontal_align' => 'Horizontalna poravnava', 'vertical_align' => 'Vertikana poravnava', 'css_class' => 'CSS class', 'no_wrap' => 'Brez preloma (wrap)', 'bg_color' => 'Barva ozadja', 'ok' => '   OK   ', 'cancel' => 'Prekini', 'left' => 'Levo', 'center' => 'Center', 'right' => 'Desno', 'top' => 'Zgoraj', 'middle' => 'Sredina', 'bottom' => 'Spodaj', 'baseline' => 'Baseline',),
        'symbols' => array('title' => 'Posebni znaki', 'ok' => '   OK   ', 'cancel' => 'Prekini',),
        'templates' => array('title' => 'Predloge',),
        'page_prop' => array('title' => 'Lastnosti strani', 'title_tag' => 'Naslov', 'charset' => 'Nabor znakov', 'background' => 'Slika v ozadju', 'bgcolor' => 'Barva ozadja', 'text' => 'Barva teksta', 'link' => 'Barva povezav', 'vlink' => 'Barva �e obiskane povezave', 'alink' => 'Barva aktivne povezave', 'leftmargin' => 'Meja levo', 'topmargin' => 'Meja zgoraj', 'css_class' => 'CSS class', 'ok' => '   OK   ', 'cancel' => 'Prekini',),
        'preview' => array('title' => 'Predogled',),
        'image_popup' => array('title' => 'Popup s sliko',),
        'zoom' => array('title' => 'Zoom',),
);
?>
