"! schema.org: PERSON A person (alive, dead, undead, or fictional).
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_person DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_thing
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_additional_name RETURNING VALUE(r_result) TYPE string,
      set_additional_name IMPORTING i_additional_name TYPE string,
      get_address RETURNING VALUE(r_result) TYPE REF TO zcl_schema_postaladdress,
      set_address IMPORTING i_address TYPE REF TO zcl_schema_postaladdress,
      set_address_json IMPORTING i_address TYPE string,
      get_children RETURNING VALUE(r_result) TYPE zcl_schema_thing=>tt_things,
      set_children IMPORTING i_children TYPE zcl_schema_thing=>tt_things,
      set_children_json IMPORTING i_children TYPE string,
      get_colleague RETURNING VALUE(r_result) TYPE zcl_schema_thing=>tt_things,
      set_colleague IMPORTING i_colleague TYPE zcl_schema_thing=>tt_things,
      set_colleague_json IMPORTING i_colleague TYPE string,
      get_family_name RETURNING VALUE(r_result) TYPE string,
      set_family_name IMPORTING i_family_name TYPE string,
      get_given_name RETURNING VALUE(r_result) TYPE string,
      set_given_name IMPORTING i_given_name TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CONSTANTS:
      type TYPE string VALUE 'Person'.

    DATA:
      "! An additional name for a Person, can be used for a middle name.
      additional_name TYPE string,
      "! Physical address of the item.
      address         TYPE REF TO zcl_schema_postaladdress,
      "! A child of the person.
      children        TYPE zcl_schema_thing=>tt_things,
      "! A colleague of the person. Supersedes colleagues.
      colleague       TYPE zcl_schema_thing=>tt_things,
      "! Family name. In the U.S., the last name of an Person. This can be used along with givenName instead of the name property.
      family_name     TYPE string,
      "! Given name. In the U.S., the first name of a Person. This can be used along with familyName instead of the name property.
      given_name      TYPE string.

ENDCLASS.



CLASS ZCL_SCHEMA_PERSON IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_additional_name.
    r_result = me->additional_name.
  ENDMETHOD.


  METHOD get_address.
    r_result = me->address.
  ENDMETHOD.


  METHOD get_children.
    r_result = me->children.
  ENDMETHOD.


  METHOD get_colleague.
    r_result = me->colleague.
  ENDMETHOD.


  METHOD get_family_name.
    r_result = me->family_name.
  ENDMETHOD.


  METHOD get_given_name.
    r_result = me->given_name.
  ENDMETHOD.


  METHOD set_additional_name.
    me->additional_name = i_additional_name.
  ENDMETHOD.


  METHOD set_address.
    me->address = i_address.
  ENDMETHOD.


  METHOD set_address_json.
    me->address = NEW #( i_address ).
  ENDMETHOD.


  METHOD set_children.
    me->children = i_children.
  ENDMETHOD.


  METHOD set_children_json.
    me->children = me->create_table(
      i_type = 'PERSON'
      i_json = i_children
    ).
  ENDMETHOD.


  METHOD set_colleague.
    me->colleague = i_colleague.
  ENDMETHOD.


  METHOD set_colleague_json.

    me->colleague = me->create_table(
      i_type = 'PERSON'
      i_json = i_colleague
    ).

  ENDMETHOD.


  METHOD set_family_name.
    me->family_name = i_family_name.
  ENDMETHOD.


  METHOD set_given_name.
    me->given_name = i_given_name.
  ENDMETHOD.
ENDCLASS.