"! <p class="shorttext synchronized" lang="de">schema.org: AggregateRating The average rating based on ..</p>
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_aggregaterating DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_rating
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_item_reviewed RETURNING VALUE(r_result) TYPE REF TO zcl_schema_thing,
      set_item_reviewed IMPORTING i_item_reviewed TYPE REF TO zcl_schema_thing,
      set_item_reviewed_json IMPORTING i_item_reviewed TYPE string,
      get_rating_count RETURNING VALUE(r_result) TYPE i,
      set_rating_count IMPORTING i_rating_count TYPE i,
      set_rating_count_json IMPORTING i_rating_count TYPE string,
      get_review_count RETURNING VALUE(r_result) TYPE i,
      set_review_count IMPORTING i_review_count TYPE i,
      set_review_count_json IMPORTING i_review_count TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'AggregateRating'.

    DATA:
      "! The item that is being reviewed/rated.
      item_reviewed TYPE REF TO zcl_schema_thing,
      "! The count of total number of ratings.
      rating_count  TYPE i,
      "! The count of total number of reviews.
      review_count  TYPE i.

ENDCLASS.



CLASS ZCL_SCHEMA_AGGREGATERATING IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_item_reviewed.
    r_result = me->item_reviewed.
  ENDMETHOD.


  METHOD get_rating_count.
    r_result = me->rating_count.
  ENDMETHOD.


  METHOD get_review_count.
    r_result = me->review_count.
  ENDMETHOD.


  METHOD set_item_reviewed.
    me->item_reviewed = i_item_reviewed.
  ENDMETHOD.


  METHOD set_item_reviewed_json.
    me->item_reviewed = NEW #( i_item_reviewed ).
  ENDMETHOD.


  METHOD set_rating_count.
    me->rating_count = i_rating_count.
  ENDMETHOD.


  METHOD set_rating_count_json.
    me->rating_count = i_rating_count.
  ENDMETHOD.


  METHOD set_review_count.
    me->review_count = i_review_count.
  ENDMETHOD.


  METHOD set_review_count_json.
    me->review_count = i_review_count.
  ENDMETHOD.
ENDCLASS.