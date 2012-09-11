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
$spaw_lang_charset = 'Shift_JIS';

// language text data array
// first dimension - block, second - exact phrase
// alternative text for toolbar buttons and title for dropdowns - 'title'

$spaw_lang_data = array(
  'cut' => array(
    'title' => '�؂���'
    ),
  'copy' => array(
    'title' => '�R�s�['
    ),
  'paste' => array(
    'title' => '�\��t��'
    ),
  'undo' => array(
    'title' => '���ɖ߂�'
    ),
  'redo' => array(
    'title' => '��蒼��'
    ),
  'hyperlink' => array(
    'title' => '�n�C�p�[�����N'
    ),
  'image_insert' => array(
    'title' => '�C���[�W�̑}��',
    'select' => ' �I������ ',
    'cancel' => '�L�����Z��',
    'library' => '���C�u����',
    'preview' => '�v���r���[',
    'images' => '�C���[�W',
    'upload' => '�A�b�v���[�h',
    'upload_button' => '�A�b�v���[�h',
    'error' => '�G���[',
    'error_no_image' => '�C���[�W���w�肵�ĉ�����',
    'error_uploading' => '�A�b�v���[�h���ɃG���[���N����܂����B�������Ă��������x���s���Ă݂Ă��������B',
    'error_wrong_type' => '�C���[�W�t�@�C���ł͂���܂���',
    'error_no_dir' => '���C�u������������܂���',
    ),
  'image_prop' => array(
    'title' => '�C���[�W�̃v���p�e�B',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    'source' => '�Q�Ɛ�',
    'alt' => '��փe�L�X�g',
    'align' => '�s����',
    'left' => '��',
    'right' => '�E',
    'top' => '��',
    'middle' => '����',
    'bottom' => '��',
    'absmiddle' => '����(��ΓI)',
    'texttop' => '��(��ΓI)',
    'baseline' => '�x�[�X���C��',
    'width' => '��',
    'height' => '����',
    'border' => '�{�[�_�[',
    'hspace' => '���Ԋu',
    'vspace' => '�c�Ԋu',
    'error' => '�G���[',
    'error_width_nan' => '�����͂��ĉ�����',
    'error_height_nan' => '�������͂��ĉ�����',
    'error_border_nan' => '�{�[�_�[���͂��ĉ�����',
    'error_hspace_nan' => '���Ԋu���͂��ĉ�����',
    'error_vspace_nan' => '�c�Ԋu���͂��ĉ�����',
    ),
  'hr' => array(
    'title' => '��؂��'
    ),
  'table_create' => array(
    'title' => '�e�[�u���̍쐬'
    ),
  'table_prop' => array(
    'title' => '�e�[�u���̃v���p�e�B',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    'rows' => '�s',
    'columns' => '��',
    'width' => '��',
    'height' => '����',
    'border' => '�{�[�_�[',
    'pixels' => '�s�N�Z��',
    'cellpadding' => '�Z�����]��',
    'cellspacing' => '�Z�����Ԋu',
    'bg_color' => '�w�i�F',
    'error' => '�G���[',
    'error_rows_nan' => '�s���͂��ĉ�����',
    'error_columns_nan' => '����͂��ĉ�����',
    'error_width_nan' => '�����͂��ĉ�����',
    'error_height_nan' => '�������͂��ĉ�����',
    'error_border_nan' => '�{�[�_�[���͂��ĉ�����',
    'error_cellpadding_nan' => '�Z�����]�����͂��ĉ�����',
    'error_cellspacing_nan' => '�Z�����Ԋu���͂��ĉ�����',
    ),
  'table_cell_prop' => array(
    'title' => '�Z���̃v���p�e�B',
    'horizontal_align' => '������',
    'vertical_align' => '�c����',
    'width' => '��',
    'height' => '����',
    'css_class' => 'CSS �N���X',
    'no_wrap' => '�܂�Ԃ��Ȃ�',
    'bg_color' => '�w�i�F',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    'left' => '��',
    'center' => '����',
    'right' => '�E',
    'top' => '��',
    'middle' => '����',
    'bottom' => '��',
    'baseline' => '�x�[�X���C��',
    'error' => '�G���[',
    'error_width_nan' => '�����͂��ĉ�����',
    'error_height_nan' => '�������͂��ĉ�����',
    ),
  'table_row_insert' => array(
    'title' => '�s�̑}��'
    ),
  'table_column_insert' => array(
    'title' => '��̑}��'
    ),
  'table_row_delete' => array(
    'title' => '�s�̍폜'
    ),
  'table_column_delete' => array(
    'title' => '��̍폜'
    ),
  'table_cell_merge_right' => array(
    'title' => '�E�̗�ƌ���'
    ),
  'table_cell_merge_down' => array(
    'title' => '���̍s�ƌ���'
    ),
  'table_cell_split_horizontal' => array(
    'title' => '�s�𕪊�'
    ),
  'table_cell_split_vertical' => array(
    'title' => '��𕪊�'
    ),
  'style' => array(
    'title' => '�X�^�C��'
    ),
  'font' => array(
    'title' => '�t�H���g'
    ),
  'fontsize' => array(
    'title' => '�T�C�Y'
    ),
  'paragraph' => array(
    'title' => '�i��'
    ),
  'bold' => array(
    'title' => '����'
    ),
  'italic' => array(
    'title' => '�Α�'
    ),
  'underline' => array(
    'title' => '����'
    ),
  'ordered_list' => array(
    'title' => '�ԍ����X�g'
    ),
  'bulleted_list' => array(
    'title' => '���X�g'
    ),
  'indent' => array(
    'title' => '�C���f���g�ǉ�'
    ),
  'unindent' => array(
    'title' => '�C���f���g�폜'
    ),
  'left' => array(
    'title' => '������'
    ),
  'center' => array(
    'title' => '��������'
    ),
  'right' => array(
    'title' => '�E����'
    ),
  'fore_color' => array(
    'title' => '�����F'
    ),
  'bg_color' => array(
    'title' => '�w�i�F'
    ),
  'design_tab' => array(
    'title' => 'WYSIWYG (�f�U�C��) ���[�h��'
    ),
  'html_tab' => array(
    'title' => 'HTML (�R�[�h) ���[�h��'
    ),
  'colorpicker' => array(
    'title' => 'Color picker',
    'ok' => '    OK   ',
    'cancel' => '�L�����Z��',
    ),
  'cleanup' => array(
    'title' => 'HTML�N���[���A�b�v (�X�^�C���̍폜)',
    'confirm' => '���s����ƁA���ׂẴX�^�C����t�H���g��d�������^�O���������܂��B�ꍇ�ɂ���Ă͂��Ȃ��̈Ӑ}���Ȃ����ʂɂȂ邱�Ƃ�����܂��̂ł��C��t���������B',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    ),
  'toggle_borders' => array(
    'title' => '�{�[�_�[�̐؂�ւ�',
    ),
  'hyperlink' => array(
    'title' => '�n�C�p�[�����N',
    'url' => 'URL',
    'name' => '�T�C�g��',
    'target' => '�^�[�Q�b�g',
    'title_attr' => '�^�C�g��',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    ),
  'table_row_prop' => array(
    'title' => '�s�̃v���p�e�B',
    'horizontal_align' => '������',
    'vertical_align' => '�c����',
    'css_class' => 'CSS �N���X',
    'no_wrap' => '�܂�Ԃ��Ȃ�',
    'bg_color' => '�w�i�F',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    'left' => '��',
    'center' => '����',
    'right' => '�E',
    'top' => '��',
    'middle' => '����',
    'bottom' => '��',
    'baseline' => '�x�[�X���C��',
    ),
  'symbols' => array(
    'title' => '���ꕶ��',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    ),
  'templates' => array(
    'title' => '�e���v���[�g',
    ),
  'page_prop' => array(
    'title' => '�y�[�W�̃v���p�e�B',
    'title_tag' => '�^�C�g��',
    'charset' => '�����R�[�h',
    'background' => '�w�i�C���[�W',
    'bgcolor' => '�w�i�F',
    'text' => '�����F',
    'link' => '�����N�F',
    'vlink' => '�K��ς݃����N�F',
    'alink' => '�A�N�e�B�u�����N�F',
    'leftmargin' => '���}�[�W��',
    'topmargin' => '��}�[�W��',
    'css_class' => 'CSS �N���X',
    'ok' => '    OK    ',
    'cancel' => '�L�����Z��',
    ),
  'preview' => array(
    'title' => '�v���r���[',
    ),
  'image_popup' => array(
    'title' => '�C���[�W�̃|�b�v�A�b�v',
    ),
  'zoom' => array(
    'title' => '�g��',
    ),
    );
    ?>

