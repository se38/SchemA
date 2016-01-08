"! <p class="shorttext synchronized" lang="de">schema.org: IMAGEOBJECT An image file.</p>
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_imageobject DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_mediaobject
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_caption RETURNING VALUE(r_result) TYPE string,
      set_caption IMPORTING i_caption TYPE string,
      get_exif_data RETURNING VALUE(r_result) TYPE string,
      set_exif_data IMPORTING i_exif_data TYPE string,
      get_thumbnail RETURNING VALUE(r_result) TYPE REF TO zcl_schema_imageobject,
      set_thumbnail IMPORTING i_thumbnail TYPE REF TO zcl_schema_imageobject,
      set_thumbnail_json IMPORTING i_thumbnail TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'ImageObject'.

    DATA:
      caption   TYPE string,
      exif_data TYPE string,
*      representative_Of_Page TYPE abap_bool,
      thumbnail TYPE REF TO zcl_schema_imageobject.

ENDCLASS.



CLASS ZCL_SCHEMA_IMAGEOBJECT IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_caption.
    r_result = me->caption.
  ENDMETHOD.


  METHOD get_exif_data.
    r_result = me->exif_data.
  ENDMETHOD.


  METHOD get_thumbnail.
    r_result = me->thumbnail.
  ENDMETHOD.


  METHOD set_caption.
    me->caption = i_caption.
  ENDMETHOD.


  METHOD set_exif_data.
    me->exif_data = i_exif_data.
  ENDMETHOD.


  METHOD set_thumbnail.
    me->thumbnail = i_thumbnail.
  ENDMETHOD.


  METHOD set_thumbnail_json.
    me->thumbnail = NEW #( i_thumbnail ).
  ENDMETHOD.
ENDCLASS.