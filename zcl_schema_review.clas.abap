"! schema.org: REVIEW A review of an item - for example, of a restaurant, movie, or store.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_review DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_creativework
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_item_reviewed RETURNING VALUE(r_result) TYPE REF TO zcl_schema_thing,
      set_item_reviewed IMPORTING i_item_reviewed TYPE REF TO zcl_schema_thing,
      set_item_reviewed_json IMPORTING i_item_reviewed TYPE string,
      get_review_body RETURNING VALUE(r_result) TYPE string,
      set_review_body IMPORTING i_review_body TYPE string,
      get_review_rating RETURNING VALUE(r_result) TYPE REF TO zcl_schema_rating,
      set_review_rating IMPORTING i_review_rating TYPE REF TO zcl_schema_rating,
      set_review_rating_json IMPORTING i_review_rating TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Review'.

    DATA:
      "! The item that is being reviewed/rated.
      item_reviewed TYPE REF TO zcl_schema_thing,
      "! The actual body of the review.
      review_body   TYPE string,
      "! The rating given in this review. Note that reviews can themselves be rated. The reviewRating applies to rating given by the review. The aggregateRating property applies to the review itself, as a creative work.
      review_rating TYPE REF TO zcl_schema_rating.
ENDCLASS.



CLASS ZCL_SCHEMA_REVIEW IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_item_reviewed.
    r_result = me->item_reviewed.
  ENDMETHOD.


  METHOD get_review_body.
    r_result = me->review_body.
  ENDMETHOD.


  METHOD get_review_rating.
    r_result = me->review_rating.
  ENDMETHOD.


  METHOD set_item_reviewed.
    me->item_reviewed = i_item_reviewed.
  ENDMETHOD.


  METHOD set_item_reviewed_json.
    me->item_reviewed = NEW #( i_item_reviewed ).
  ENDMETHOD.


  METHOD set_review_body.
    me->review_body = i_review_body.
  ENDMETHOD.


  METHOD set_review_rating.
    me->review_rating = i_review_rating.
  ENDMETHOD.


  METHOD set_review_rating_json.
    me->review_rating = NEW #( i_review_rating ).
  ENDMETHOD.
ENDCLASS.