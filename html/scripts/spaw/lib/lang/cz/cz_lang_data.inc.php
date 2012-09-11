<?php
// ================================================
// SPAW PHP WYSIWYG editor control
// ================================================
// Czech language file
// ================================================
// Developed: Alan Mendelevich, alan@solmetra.lt
// Copyright: Solmetra (c)2003 All rights reserved.
// Czech translation: BrM (BrM@bridlicna.cz)
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
    'title' => 'Vyjmout'
    ),
  'copy' => array(
    'title' => 'Kop�rovat'
    ),
  'paste' => array(
    'title' => 'Vlo�it'
    ),
  'undo' => array(
    'title' => 'Zp�t'
    ),
  'redo' => array(
    'title' => 'Znovu'
    ),
  'hyperlink' => array(
    'title' => 'Hyperlink'
    ),
  'image_insert' => array(
    'title' => 'Vlo�it obr�zek',
    'select' => 'Vybrat',
	'delete' => 'Smazat', // new 1.0.5
    'cancel' => 'Zru�it',
    'library' => 'Knihovna',
    'preview' => 'N�hled',
    'images' => 'Obr�zek',
    'upload' => 'Poslat obr�zek',
    'upload_button' => 'Poslat',
    'error' => 'Chyba',
    'error_no_image' => 'Vyberte pros�m obr�zek',
    'error_uploading' => 'V pr�b�hu uploadu do�lo k chyb�. Opakujte akci znovu',
    'error_wrong_type' => 'Chybn� form�t obr�zku',
    'error_no_dir' => 'Knihovna fyzicky neexistuje',
	'error_cant_delete' => 'Obr�zek nebylo mo�no smazat', // new 1.0.5
    ),
  'image_prop' => array(
    'title' => 'Vlastnosti obr�zku',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
    'source' => 'Zdroj',
    'alt' => 'Alternativn� text',
    'align' => 'Zarovn�n�',
    'left' => 'Vlevo',
    'right' => 'Vpravo',
    'top' => 'Nahoru',
    'middle' => 'Doprost�ed',
    'bottom' => 'Dol�',
    'absmiddle' => 'Absolutn� st�ed',
    'texttop' => 'Text nahoru',
    'baseline' => 'Z�kladn� linka',
    'width' => '���ka',
    'height' => 'V�ka',
    'border' => 'Okraje',
    'hspace' => 'Hor. space',
    'vspace' => 'Vert. space',
    'error' => 'Chyba',
    'error_width_nan' => '���ka nen� ��slo',
    'error_height_nan' => 'V�ka nen� ��slo',
    'error_border_nan' => 'Okraj nen� ��slo',
    'error_hspace_nan' => 'Horizont�ln� rozte� nen� ��slo',
    'error_vspace_nan' => 'Vertik�ln� rozte� nen� ��slo',
    ),
  'hr' => array(
    'title' => 'Horizontal rule'
    ),
  'table_create' => array(
    'title' => 'Vytvo� tabulku'
    ),
  'table_prop' => array(
    'title' => 'Vlastnosti tabulky',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
    'rows' => '��dk�',
    'columns' => 'Sloupc�',
    'width' => '���ka',
    'height' => 'V�ka',
    'border' => 'Okraje',
    'pixels' => 'pixel�',
    'css_class' => 'T��da CSS', // <=== new 1.0.6
    'background' => 'Obr�zek pozad�', // <=== new 1.0.6
    'cellpadding' => 'Odsazen� v bu�ce',
    'cellspacing' => 'Vzd�lenost bun�k',
    'bg_color' => 'Barva pozad�',
    'error' => 'Chyba',
    'error_rows_nan' => '��dky nejsou ��slo',
    'error_columns_nan' => 'Sloupce nejsou ��slo',
    'error_width_nan' => '���ka nen� ��slo',
    'error_height_nan' => 'V�ka nen� ��slo',
    'error_border_nan' => 'Okraje nejsou ��slo',
    'error_cellpadding_nan' => 'Odsazen� v bu�ce nen� ��slo',
    'error_cellspacing_nan' => 'Vzd�lenost bu�ek nen� ��slo',
    ),
  'table_cell_prop' => array(
    'title' => 'Vlastnosti bu�ky',
    'horizontal_align' => 'Horizont�ln� zarovn�n�',
    'vertical_align' => 'Vertik�ln� zarovn�n�',
    'width' => '���ka',
    'height' => 'V�ka',
    'css_class' => 'T��da CSS',
    'no_wrap' => 'Nezalamovat',
    'bg_color' => 'Barva pozad�',
    'background' => 'Obr�zek pozad�', // <=== new 1.0.6
    'ok' => '   OK   ',
    'cancel' => 'Zru�it',
    'left' => 'Vlevo',
    'center' => 'Na st�ed',
    'right' => 'Vpravo',
    'top' => 'Nahoru',
    'middle' => 'Doprost�ed',
    'bottom' => 'Dol�',
    'baseline' => 'Z�kladn� linka',
    'error' => 'Chyba',
    'error_width_nan' => '���ka nen� ��slo',
    'error_height_nan' => 'V�ka nen� ��slo',

    ),
  'table_row_insert' => array(
    'title' => 'Vlo�it ��dek'
    ),
  'table_column_insert' => array(
    'title' => 'Vlo�it sloupec'
    ),
  'table_row_delete' => array(
    'title' => 'Vyma� ��dek'
    ),
  'table_column_delete' => array(
    'title' => 'Vyma� sloupec'
    ),
  'table_cell_merge_right' => array(
    'title' => 'Slou�it vpravo'
    ),
  'table_cell_merge_down' => array(
    'title' => 'Slou�it dol�'
    ),
  'table_cell_split_horizontal' => array(
    'title' => 'Rozd�lit bu�ku horizont�ln�'
    ),
  'table_cell_split_vertical' => array(
    'title' => 'Rozd�lit bu�ku vertik�ln�'
    ),
  'style' => array(
    'title' => 'Styl'
    ),
  'font' => array(
    'title' => 'Font'
    ),
  'fontsize' => array(
    'title' => 'Velikost'
    ),
  'paragraph' => array(
    'title' => 'Odstavec'
    ),
  'bold' => array(
    'title' => 'Tu�n�'
    ),
  'italic' => array(
    'title' => 'Kurz�va'
    ),
  'underline' => array(
    'title' => 'Podtr�en�'
    ),
  'ordered_list' => array(
    'title' => '��slov�n�'
    ),
  'bulleted_list' => array(
    'title' => 'Odr�ky'
    ),
  'indent' => array(
    'title' => 'Zv�t�it odsazen�'
    ),
  'unindent' => array(
    'title' => 'Zmen�it odsazen�'
    ),
  'left' => array(
    'title' => 'Vlevo'
    ),
  'center' => array(
    'title' => 'Na st�ed'
    ),
  'right' => array(
    'title' => 'Vpravo'
    ),
  'fore_color' => array(
    'title' => 'Barva pop�ed�'
    ),
  'bg_color' => array(
    'title' => 'Barva pozad�'
    ),
  'design_tab' => array(
    'title' => 'P�epnout do WYSIWYG re�imu'
    ),
  'html_tab' => array(
    'title' => 'P�epnout do HTML re�imu'
    ),
  'colorpicker' => array(
    'title' => 'Paleta barev',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
    ),
    // <<<<<<<<< NEW >>>>>>>>>
  'cleanup' => array(
    'title' => 'Vy�i�t�n� HTML (odstranit styly)',
    'confirm' => 'Proveden�m akce odstran�te v�echny styly, fonty a zbyte�n� tagy z aktu�ln�ho obsahu. Va�e form�tov�n� bude ��ste�n� �i �pln� odstran�no.',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
    ),
  'toggle_borders' => array(
    'title' => 'P�epnout okraje',
    ),
  'hyperlink' => array(
    'title' => 'Hyperlink',
    'url' => 'URL',
    'name' => 'Jm�no',
    'target' => 'C�l',
    'title_attr' => 'Popisek',
	'a_type' => 'Typ', // <=== new 1.0.6
	'type_link' => 'Odkaz', // <=== new 1.0.6
	'type_anchor' => 'Kotva', // <=== new 1.0.6
	'type_link2anchor' => 'Odkaz na kotvu', // <=== new 1.0.6
	'anchors' => 'Kotvy', // <=== new 1.0.6
    'ok' => '   OK   ',
    'cancel' => 'Storno',
    ),
  'hyperlink_targets' => array( // <=== new 1.0.5
  	'_self' => 'Stejn� r�mec (_self)',
	'_blank' => 'Nov� okno (_blank)',
	'_top' => 'Vrchn� r�mec (_top)',
	'_parent' => 'Nad�azen� r�mec (_parent)'
	),
  'table_row_prop' => array(
    'title' => 'Vlastnosti ��dku',
    'horizontal_align' => 'Horizont�ln� zarovn�n�',
    'vertical_align' => 'Vertik�ln� zarovn�n�',
    'css_class' => 'T��da CSS',
    'no_wrap' => 'Nezalamovat',
    'bg_color' => 'Barva pozad�',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
    'left' => 'Vlevo',
    'center' => 'Na st�ed',
    'right' => 'Vpravo',
    'top' => 'Nahoru',
    'middle' => 'Doprost�ed',
    'bottom' => 'Dol�',
    'baseline' => 'Z�kladn� linka',
	),
  'symbols' => array(
    'title' => 'Speci�ln� znaky',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
	),
  'symbols' => array(
    'title' => 'Speci�ln� znaky',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
	),
  'templates' => array(
    'title' => '�ablony',
	),
  'page_prop' => array(
    'title' => 'Vlastnosti str�nky',
    'title_tag' => 'N�zev',
    'charset' => 'Znakov� sada',
    'background' => 'Obr�zek pozad�',
    'bgcolor' => 'Barva pozad�',
    'text' => 'Barva textu',
    'link' => 'Barva odkazu',
    'vlink' => 'Barva nav�t�ven�ho odkazu',
    'alink' => 'Barva aktivn�ho odkazu',
    'leftmargin' => 'Lev� okraj',
    'topmargin' => 'Horn� okraj',
    'css_class' => 'T��da CSS',
    'ok' => '   OK   ',
    'cancel' => 'Storno',
	),
  'preview' => array(
    'title' => 'N�hled',
	),
  'image_popup' => array(
    'title' => 'Odkaz na obr�zek v nov�m okn�',
	),
  'zoom' => array(
    'title' => 'P�ibl�en�',
	),
	);
	?>

