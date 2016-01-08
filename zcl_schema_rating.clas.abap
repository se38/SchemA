"! schema.org: RATING A rating is an evaluation on a numeric scale, such as 1 to 5 stars.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_rating DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_intangible
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_best_rating RETURNING VALUE(r_result) TYPE f,
      set_best_rating IMPORTING i_best_rating TYPE f,
      get_rating_value RETURNING VALUE(r_result) TYPE f,
      set_rating_value IMPORTING i_rating_value TYPE f,
      get_worst_rating RETURNING VALUE(r_result) TYPE f,
      set_worst_rating IMPORTING i_worst_rating TYPE f.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Rating'.

    DATA:
      "! The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.
      best_rating  TYPE f,
      "! The rating for the content.
      rating_value TYPE f,
      "! The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.
      worst_rating TYPE f.
ENDCLASS.



CLASS ZCL_SCHEMA_RATING IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_best_rating.
    r_result = me->best_rating.
  ENDMETHOD.


  METHOD get_rating_value.
    r_result = me->rating_value.
  ENDMETHOD.


  METHOD get_worst_rating.
    r_result = me->worst_rating.
  ENDMETHOD.


  METHOD set_best_rating.
    me->best_rating = i_best_rating.
  ENDMETHOD.


  METHOD set_rating_value.
    me->rating_value = i_rating_value.
  ENDMETHOD.


  METHOD set_worst_rating.
    me->worst_rating = i_worst_rating.
  ENDMETHOD.
ENDCLASS.