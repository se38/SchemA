"! schema.org: BRAND A brand is a name used by an organization or business person for labeling a product, product group, or similar.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_brand DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_intangible
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_aggregate_rating RETURNING VALUE(r_result) TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating IMPORTING i_aggregate_rating TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating_json IMPORTING i_aggregate_rating TYPE string,
      get_logo RETURNING VALUE(r_result) TYPE REF TO zcl_schema_imageobject,
      set_logo IMPORTING i_logo TYPE REF TO zcl_schema_imageobject,
      set_logo_json IMPORTING i_logo TYPE string,
      get_review RETURNING VALUE(r_result) TYPE REF TO zcl_schema_review,
      set_review IMPORTING i_review TYPE REF TO zcl_schema_review,
      set_review_json IMPORTING i_review TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Brand'.

    DATA:
      "! The overall rating, based on a collection of reviews or ratings, of the item.
      aggregate_rating TYPE REF TO zcl_schema_aggregaterating,
      "! An associated logo.
      logo             TYPE REF TO zcl_schema_imageobject,
      "! A review of the item. Supersedes reviews.
      review           TYPE REF TO zcl_schema_review.
ENDCLASS.



CLASS ZCL_SCHEMA_BRAND IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_aggregate_rating.
    r_result = me->aggregate_rating.
  ENDMETHOD.


  METHOD get_logo.
    r_result = me->logo.
  ENDMETHOD.


  METHOD get_review.
    r_result = me->review.
  ENDMETHOD.


  METHOD set_aggregate_rating.
    me->aggregate_rating = i_aggregate_rating.
  ENDMETHOD.


  METHOD set_aggregate_rating_json.
    me->aggregate_rating = NEW #( i_aggregate_rating ).
  ENDMETHOD.


  METHOD set_logo.
    me->logo = i_logo.
  ENDMETHOD.


  METHOD set_logo_json.
    me->logo = NEW #( i_logo ).
  ENDMETHOD.


  METHOD set_review.
    me->review = i_review.
  ENDMETHOD.


  METHOD set_review_json.
    me->review = NEW #( i_review ).
  ENDMETHOD.
ENDCLASS.
