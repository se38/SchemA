"! schema.org: ARTICLE An article, such as a news article or piece of investigative report. Newspapers and magazines have articles of many different types and this is intended to cover them all.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_article DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_creativework
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_article_body RETURNING VALUE(r_result) TYPE string,
      set_article_body IMPORTING i_article_body TYPE string,
      get_article_section RETURNING VALUE(r_result) TYPE string,
      set_article_section IMPORTING i_article_section TYPE string,
      get_page_end RETURNING VALUE(r_result) TYPE string,
      set_page_end IMPORTING i_page_end TYPE string,
      get_page_start RETURNING VALUE(r_result) TYPE string,
      set_page_start IMPORTING i_page_start TYPE string,
      get_pagination RETURNING VALUE(r_result) TYPE string,
      set_pagination IMPORTING i_pagination TYPE string,
      get_word_count RETURNING VALUE(r_result) TYPE i,
      set_word_count IMPORTING i_word_count TYPE i,
      set_word_count_json IMPORTING i_word_count TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Article'.

    DATA:
      "! The actual body of the article.
      article_body    TYPE string,
      "! Articles may belong to one or more 'sections' in a magazine or newspaper, such as Sports, Lifestyle, etc.
      article_section TYPE string,
      "! The page on which the work ends; for example "138" or "xvi".
      page_end        TYPE string,
      "! The page on which the work starts; for example "135" or "xiii".
      page_start      TYPE string,
      "! Any description of pages that is not separated into pageStart and pageEnd; for example, "1-6, 9, 55" or "10-12, 46-49".
      pagination      TYPE string,
      "! The number of words in the text of the Article.
      word_count      TYPE i.

ENDCLASS.



CLASS ZCL_SCHEMA_ARTICLE IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_article_body.
    r_result = me->article_body.
  ENDMETHOD.


  METHOD get_article_section.
    r_result = me->article_section.
  ENDMETHOD.


  METHOD get_page_end.
    r_result = me->page_end.
  ENDMETHOD.


  METHOD get_page_start.
    r_result = me->page_start.
  ENDMETHOD.


  METHOD get_pagination.
    r_result = me->pagination.
  ENDMETHOD.


  METHOD get_word_count.
    r_result = me->word_count.
  ENDMETHOD.


  METHOD set_article_body.
    me->article_body = i_article_body.
  ENDMETHOD.


  METHOD set_article_section.
    me->article_section = i_article_section.
  ENDMETHOD.


  METHOD set_page_end.
    me->page_end = i_page_end.
  ENDMETHOD.


  METHOD set_page_start.
    me->page_start = i_page_start.
  ENDMETHOD.


  METHOD set_pagination.
    me->pagination = i_pagination.
  ENDMETHOD.


  METHOD set_word_count.
    me->word_count = i_word_count.
  ENDMETHOD.


  METHOD set_word_count_json.
    me->word_count = i_word_count.
  ENDMETHOD.
ENDCLASS.
