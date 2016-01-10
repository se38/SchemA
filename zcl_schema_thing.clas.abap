"! <p class="shorttext synchronized" lang="en">schema.org: THING The most generic type of item</p>
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_thing DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: tt_things TYPE STANDARD TABLE OF REF TO zcl_schema_thing WITH EMPTY KEY.

    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_additional_type RETURNING VALUE(r_result) TYPE string,
      set_additional_type IMPORTING i_additional_type TYPE string,
      get_alternate_name RETURNING VALUE(r_result) TYPE string,
      set_alternate_name IMPORTING i_alternate_name TYPE string,
      get_description RETURNING VALUE(r_result) TYPE string,
      set_description IMPORTING i_description TYPE string,
      get_image RETURNING VALUE(r_result) TYPE REF TO zcl_schema_imageobject,
      set_image IMPORTING i_image TYPE REF TO zcl_schema_imageobject,
      set_image_json IMPORTING i_image TYPE string,
      get_main_entity_of_page RETURNING VALUE(r_result) TYPE string,
      set_main_entity_of_page IMPORTING i_main_entity_of_page TYPE string,
      get_name RETURNING VALUE(r_result) TYPE string,
      set_name IMPORTING i_name TYPE string,
      get_same_as RETURNING VALUE(r_result) TYPE string,
      set_same_as IMPORTING i_same_as TYPE string,
      get_url RETURNING VALUE(r_result) TYPE string,
      set_url IMPORTING i_url TYPE string,
      get_id RETURNING VALUE(r_result) TYPE string,
      set_id IMPORTING i_id TYPE string,
      get_detailed_description RETURNING VALUE(r_result) TYPE REF TO zcl_schema_article,
      set_detailed_description IMPORTING i_detailed_description TYPE REF TO zcl_schema_article,
      set_detailed_description_json IMPORTING i_detailed_description TYPE string,
      get_json
        IMPORTING i_without_context TYPE abap_bool OPTIONAL
        RETURNING VALUE(r_result)   TYPE string.

  PROTECTED SECTION.
    METHODS:
      "! append attributes of this and all super classes as JSON
      append_attributes
        CHANGING c_json TYPE string,
      create_table
        IMPORTING i_type          TYPE seoclsname
                  i_json          TYPE string
        RETURNING VALUE(r_result) TYPE tt_things.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Thing'.

    DATA:
      "! search result id
      id                   TYPE string,
      "! An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax. This is a relationship between something and a
      "! class that the thing is in. In RDFa syntax, it is better to use the native RDFa syntax - the 'typeof' attribute - for multiple types. Schema.org tools may have only weaker
      "! understanding of extra types, in particular those defined externally.
      additional_type      TYPE string,
      "! An alias for the item.
      alternate_name       TYPE string,
      "! A short description of the item.
      description          TYPE string,
      "! An image of the item. This can be a URL (or a fully described ImageObject / not yet!).
      image                TYPE REF TO zcl_schema_imageobject,
      "! Indicates a page (or other CreativeWork / not yet!) for which this thing is the main entity being described.
      main_entity_of_page  TYPE string,
      "! The name of the item.
      name                 TYPE string,
      ""! Indicates a potential Action, which describes an idealized action in which this thing would play an 'object' role.
*      potentialAction     TYPE
      "! URL of a reference Web page that unambiguously indicates the item's identity. E.g. the URL of the item's Wikipedia page, Freebase page, or official website.
      same_as              TYPE string,
      "! URL of the item.
      url                  TYPE string,
      "! An article which is a detailed description of the entity. The entity should be the primary focus of the article.
      detailed_description TYPE REF TO zcl_schema_article.

ENDCLASS.



CLASS ZCL_SCHEMA_THING IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor.
  ENDMETHOD.


  METHOD create_table.

    DATA(classname) = |ZCL_SCHEMA_{ i_type }|.
    DATA(json_doc) = zcl_json_document=>create_with_json( i_json ).

    WHILE json_doc->get_next( ) IS NOT INITIAL.
      INSERT INITIAL LINE INTO TABLE r_result ASSIGNING FIELD-SYMBOL(<thing>).

      TRY.
          CREATE OBJECT <thing> TYPE (classname)
            EXPORTING i_json = json_doc->get_json( ).
        CATCH cx_sy_create_object_error ##no_handler .
      ENDTRY.
    ENDWHILE.

  ENDMETHOD.


  METHOD get_additional_type.
    r_result = me->additional_type.
  ENDMETHOD.


  METHOD get_alternate_name.
    r_result = me->alternate_name.
  ENDMETHOD.


  METHOD get_description.
    r_result = me->description.
  ENDMETHOD.


  METHOD get_detailed_description.
    r_result = me->detailed_description.
  ENDMETHOD.


  METHOD get_id.
    r_result = me->id.
  ENDMETHOD.


  METHOD get_image.
    r_result = me->image.
  ENDMETHOD.


  METHOD get_json.

    DATA json TYPE string.

    append_attributes(
      CHANGING
        c_json = json
    ).

    DATA(classname) = cl_abap_classdescr=>get_class_name( me ).
    SHIFT classname LEFT UP TO '='.
    SHIFT classname LEFT.

    FIELD-SYMBOLS <local_type> TYPE string.
    DATA local_type TYPE string.


    ASSIGN (classname)=>type TO <local_type>.
    IF <local_type> IS ASSIGNED.
      local_type = <local_type>.
    ENDIF.

    r_result = '"@type": "' && local_type && '", ' && json.

    IF i_without_context IS INITIAL.
      r_result = '{ "@context": { "@vocab": "http://schema.org/" }, ' && r_result && '}'.
    ENDIF.

  ENDMETHOD.


  METHOD get_main_entity_of_page.
    r_result = me->main_entity_of_page.
  ENDMETHOD.


  METHOD get_name.
    r_result = me->name.
  ENDMETHOD.


  METHOD get_same_as.
    r_result = me->same_as.
  ENDMETHOD.


  METHOD get_url.
    r_result = me->url.
  ENDMETHOD.


  METHOD set_additional_type.
    me->additional_type = i_additional_type.
  ENDMETHOD.


  METHOD set_alternate_name.
    me->alternate_name = i_alternate_name.
  ENDMETHOD.


  METHOD set_description.
    me->description = i_description.
  ENDMETHOD.


  METHOD set_detailed_description.
    me->detailed_description = i_detailed_description.
  ENDMETHOD.


  METHOD set_detailed_description_json.
    me->detailed_description = NEW #( i_detailed_description ).
  ENDMETHOD.


  METHOD set_id.
    me->id = i_id.
  ENDMETHOD.


  METHOD set_image.
    me->image = i_image.
  ENDMETHOD.


  METHOD set_image_json.
    me->image = NEW #( i_image ).
  ENDMETHOD.


  METHOD set_main_entity_of_page.
    me->main_entity_of_page = i_main_entity_of_page.
  ENDMETHOD.


  METHOD set_name.
    me->name = i_name.
  ENDMETHOD.


  METHOD set_same_as.
    me->same_as = i_same_as.
  ENDMETHOD.


  METHOD set_url.
    me->url = i_url.
  ENDMETHOD.
ENDCLASS.