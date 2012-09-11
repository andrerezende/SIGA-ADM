<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// Slovak language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Copyright: Solmetra (c)2003 All rights reserved.
// Slovak translation: Pavel Koutny
//                     pavel.koutny@inetix.sk
// ------------------------------------------------
//                                www.solmetra.com
// ================================================
// v.1.0, 2003-03-20
// ================================================

// charset to be used in dialogs
$spaw_lang_charset = 'iso-8859-2';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array(
  'cut' => array(
    'title' => 'Vystrihn�'
    ),
  'copy' => array(
    'title' => 'Kop�rova�'
    ),
  'paste' => array(
    'title' => 'Vlo�i�'
    ),
  'undo' => array(
    'title' => 'Vr�ti�'
    ),
  'redo' => array(
    'title' => 'Vykona�'
    ),
  'hyperlink' => array(
    'title' => 'Hyperlink'
    ),
  'image_insert' => array(
    'title' => 'Vlo�i� obr�zok',
    'select' => 'Vybra�',
    'cancel' => 'Zru�i�',
    'library' => 'Kni�nica',
    'preview' => 'N�h�ad',
    'images' => 'Obr�zky',
    'upload' => 'Nahra� obr�zek',
    'upload_button' => 'Nahra�',
    'error' => 'Chyba',
    'error_no_image' => 'Vyberte pros�m obr�zok',
    'error_uploading' => 'V priebehu nahr�vania do�lo k chybe. Zopakujte to.',
    'error_wrong_type' => 'chybn� form�t obr�zku',
    'error_no_dir' => 'Kni�nica neexistuje',
    ),
  'image_prop' => array(
    'title' => 'Vlastnosti obr�zku',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    'source' => 'Zdroj',
    'alt' => 'Alternat�vny text',
    'align' => 'Zarovnanie',
    'left' => 'v�evo',
    'right' => 'vpravo',
    'top' => 'Zhora',
    'middle' => 'Na stred',
    'bottom' => 'Zdole',
    'absmiddle' => 'absol�tny stred',
    'texttop' => 'text-hore',
    'baseline' => 'Z�kladn� linka',
    'width' => '��rka',
    'height' => 'V�ka',
    'border' => 'Okraje',
    'hspace' => 'Hor. medzera',
    'vspace' => 'Vert. medzera',
    'error' => 'Chyba',
    'error_width_nan' => '��rka nie je ��slo',
    'error_height_nan' => 'V�ka nie je ��slo',
    'error_border_nan' => 'Okraj nie je ��slo',
    'error_hspace_nan' => 'Horizont�lna medzera nie je ��slo',
    'error_vspace_nan' => 'Vertik�lna medzera nie je ��slo',
    ),
  'hr' => array(
    'title' => 'Horizont�lny oddelova�'
    ),
  'table_create' => array(
    'title' => 'Vytvor tabu�ku'
    ),
  'table_prop' => array(
    'title' => 'Vlastnosti tabu�ky',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    'rows' => 'Riadkov',
    'columns' => 'St�pcov',
    'width' => '��rka',
    'height' => 'V�ka',
    'border' => 'Okraje',
    'pixels' => 'pixelov',
    'cellpadding' => 'Odsadenie v bunke',
    'cellspacing' => 'Vzdialenos� buniek',
    'bg_color' => 'Farba pozadia',
    'error' => 'Chyba',
    'error_rows_nan' => 'Riadky nie s� ��slo',
    'error_columns_nan' => 'St�pce nie s� ��slo',
    'error_width_nan' => '��rka nie je ��slo',
    'error_height_nan' => 'V�ka nie je ��slo',
    'error_border_nan' => 'Okraj nie je ��slo',
    'error_cellpadding_nan' => 'Odsadenie v bunke nie je ��slo',
    'error_cellspacing_nan' => 'Vzdialenos� buniek nie je ��slo',
    ),
  'table_cell_prop' => array(
    'title' => 'Vlastnosti bunky',
    'horizontal_align' => 'Horizont�lne zarovnanie',
    'vertical_align' => 'Vertik�lne zarovnanie',
    'width' => '��rka',
    'height' => 'V�ka',
    'css_class' => 'CSS trieda',
    'no_wrap' => 'nezalamova�',
    'bg_color' => 'Farba pozadia',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    'left' => 'V�evo',
    'center' => 'V strede',
    'right' => 'Vpravo',
    'top' => 'Zhora',
    'middle' => 'Na stred',
    'bottom' => 'Zdola',
    'baseline' => 'Z�kladn� linka',
    'error' => 'Chyba',
    'error_width_nan' => '��rka nie je ��slo',
    'error_height_nan' => 'V�ka nie je ��slo',

    ),
  'table_row_insert' => array(
    'title' => 'Vlo�i� riadok'
    ),
  'table_column_insert' => array(
    'title' => 'Vlo�i� st�pec'
    ),
  'table_row_delete' => array(
    'title' => 'Vyma� riadok'
    ),
  'table_column_delete' => array(
    'title' => 'Vyma� st�pec'
    ),
  'table_cell_merge_right' => array(
    'title' => 'Zl�i� vpravo'
    ),
  'table_cell_merge_down' => array(
    'title' => 'Zl��i� nadol'
    ),
  'table_cell_split_horizontal' => array(
    'title' => 'Rozdeli� bunku horizont�lne'
    ),
  'table_cell_split_vertical' => array(
    'title' => 'Rozdeli� bunku vertik�lne'
    ),
  'style' => array(
    'title' => '�t�l'
    ),
  'font' => array(
    'title' => 'Font'
    ),
  'fontsize' => array(
    'title' => 'Ve�kos�'
    ),
  'paragraph' => array(
    'title' => 'Odstavec'
    ),
  'bold' => array(
    'title' => 'Tu�n�'
    ),
  'italic' => array(
    'title' => '�ikm�'
    ),
  'underline' => array(
    'title' => 'Pod�iarknut�'
    ),
  'ordered_list' => array(
    'title' => '��slovanie'
    ),
  'bulleted_list' => array(
    'title' => 'Odr�ky'
    ),
  'indent' => array(
    'title' => 'Odsadenie'
    ),
  'unindent' => array(
    'title' => 'Zru�i� odsadenie'
    ),
  'left' => array(
    'title' => 'V�avo'
    ),
  'center' => array(
    'title' => 'V strede'
    ),
  'right' => array(
    'title' => 'Vpravo'
    ),
  'fore_color' => array(
    'title' => 'Barva popredia'
    ),
  'bg_color' => array(
    'title' => 'Barva pozadia'
    ),
  'design_tab' => array(
    'title' => 'Prepn� do WYSIWYG m�du'
    ),
  'html_tab' => array(
    'title' => 'P�epn� do HTML m�du'
    ),
  'colorpicker' => array(
    'title' => 'Paleta farieb',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    ),
    // <<<<<<<<< NEW >>>>>>>>>
  'cleanup' => array(
    'title' => 'HTML kontrola (odstran� �t�ly)',
    'confirm' => 'Preveden�m akcie odstr�nite v�etky �t�ly, fonty a zbyto�n� tagy z aktu�lneho obsahu. Jedno, alebo v�etky form�tovania bud� odstr�nen�.',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    ),
  'toggle_borders' => array(
    'title' => 'Upravi� okraje',
    ),
  'hyperlink' => array(
    'title' => 'Hyperlink',
    'url' => 'URL',
    'name' => 'Meno',
    'target' => 'Cie�',
    'title_attr' => 'N�zov',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    ),
  'table_row_prop' => array(
    'title' => 'Vlastnosti riadku',
    'horizontal_align' => 'Horizont�lne zarovnanie',
    'vertical_align' => 'Vertik�lne zarovnanie',
    'css_class' => 'CSS trieda',
    'no_wrap' => 'Nezalamova�',
    'bg_color' => 'Farba pozadia',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    'left' => 'V�evo',
    'center' => 'V strede',
    'right' => 'Vpravo',
    'top' => 'Zhora',
    'middle' => 'Na stred',
    'bottom' => 'Zdola',
    'baseline' => 'Z�kladn� linka',
    ),
  'symbols' => array(
    'title' => '�peci�lne znaky',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    ),
  'symbols' => array(
    'title' => '�peci�lne znaky',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    ),
  'templates' => array(
    'title' => '�abl�ny',
    ),
  'page_prop' => array(
    'title' => 'Vlastnosti str�nky',
    'title_tag' => 'N�zov',
    'charset' => 'K�dovanie',
    'background' => 'Obr�zok pozadia',
    'bgcolor' => 'Farba pozadia',
    'text' => 'Farba textu',
    'link' => 'Farba odkazu',
    'vlink' => 'Farba nav�t�ven�ho odkazu',
    'alink' => 'Farba akt�vneho odkazu',
    'leftmargin' => '�av� okraj',
    'topmargin' => 'Horn� okraj',
    'css_class' => 'CSS trieda',
    'ok' => '   OK   ',
    'cancel' => 'Zru�i�',
    ),
  'preview' => array(
    'title' => 'N�h�ad',
    ),
  'image_popup' => array(
    'title' => 'Prekr�vanie obr�zkov',
    ),
  'zoom' => array(
    'title' => 'Zv��enie',
    ),
    );
    ?>

