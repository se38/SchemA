"! <p class="shorttext synchronized" lang="de">schema.org: NEWSARTICLE A news article.</p>
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_newsarticle DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_article
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_dateline RETURNING VALUE(r_result) TYPE string,
      set_dateline IMPORTING i_dateline TYPE string,
      get_print_column RETURNING VALUE(r_result) TYPE string,
      set_print_column IMPORTING i_print_column TYPE string,
      get_print_edition RETURNING VALUE(r_result) TYPE string,
      set_print_edition IMPORTING i_print_edition TYPE string,
      get_print_page RETURNING VALUE(r_result) TYPE string,
      set_print_page IMPORTING i_print_page TYPE string,
      get_print_section RETURNING VALUE(r_result) TYPE string,
      set_print_section IMPORTING i_print_section TYPE string.

  PROTECTED SECTION.
     METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'NewsArticle'.

    DATA:
      "! The location where the NewsArticle was produced.
      dateline      TYPE string,
      "! The number of the column in which the NewsArticle appears in the print edition.
      print_column  TYPE string,
      "! The edition of the print product in which the NewsArticle appears.
      print_edition TYPE string,
      "! If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).
      print_page    TYPE string,
      "! If this NewsArticle appears in print, this field indicates the print section in which the article appeared.
      print_section TYPE string.

ENDCLASS.



CLASS ZCL_SCHEMA_NEWSARTICLE IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_dateline.
    r_result = me->dateline.
  ENDMETHOD.


  METHOD get_print_column.
    r_result = me->print_column.
  ENDMETHOD.


  METHOD get_print_edition.
    r_result = me->print_edition.
  ENDMETHOD.


  METHOD get_print_page.
    r_result = me->print_page.
  ENDMETHOD.


  METHOD get_print_section.
    r_result = me->print_section.
  ENDMETHOD.


  METHOD set_dateline.
    me->dateline = i_dateline.
  ENDMETHOD.


  METHOD set_print_column.
    me->print_column = i_print_column.
  ENDMETHOD.


  METHOD set_print_edition.
    me->print_edition = i_print_edition.
  ENDMETHOD.


  METHOD set_print_page.
    me->print_page = i_print_page.
  ENDMETHOD.


  METHOD set_print_section.
    me->print_section = i_print_section.
  ENDMETHOD.
ENDCLASS.
