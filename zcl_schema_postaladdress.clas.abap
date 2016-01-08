"! <p class="shorttext synchronized" lang="de">schema.org: POSTALADDRESS The mailing address.</p>
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_postaladdress DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_contactpoint
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_address_country RETURNING VALUE(r_result) TYPE string,
      set_address_country IMPORTING i_address_country TYPE string,
      get_address_locality RETURNING VALUE(r_result) TYPE string,
      set_address_locality IMPORTING i_address_locality TYPE string,
      get_address_region RETURNING VALUE(r_result) TYPE string,
      set_address_region IMPORTING i_address_region TYPE string,
      get_post_office_box_number RETURNING VALUE(r_result) TYPE string,
      set_post_office_box_number IMPORTING i_post_office_box_number TYPE string,
      get_postal_code RETURNING VALUE(r_result) TYPE string,
      set_postal_code IMPORTING i_postal_code TYPE string,
      get_street_address RETURNING VALUE(r_result) TYPE string,
      set_street_address IMPORTING i_street_address TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'PostalAddress'.

    DATA:
      "! The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
      address_country        TYPE string,
      "! The locality. For example, Mountain View.
      address_locality       TYPE string,
      "! The region. For example, CA.
      address_region         TYPE string,
      "! The post office box number for PO box addresses.
      post_office_box_number TYPE string,
      "! The postal code. For example, 94043.
      postal_code            TYPE string,
      "! The street address. For example, 1600 Amphitheatre Pkwy.
      street_address         TYPE string.

ENDCLASS.



CLASS ZCL_SCHEMA_POSTALADDRESS IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_address_country.
    r_result = me->address_country.
  ENDMETHOD.


  METHOD get_address_locality.
    r_result = me->address_locality.
  ENDMETHOD.


  METHOD get_address_region.
    r_result = me->address_region.
  ENDMETHOD.


  METHOD get_postal_code.
    r_result = me->postal_code.
  ENDMETHOD.


  METHOD get_post_office_box_number.
    r_result = me->post_office_box_number.
  ENDMETHOD.


  METHOD get_street_address.
    r_result = me->street_address.
  ENDMETHOD.


  METHOD set_address_country.
    me->address_country = i_address_country.
  ENDMETHOD.


  METHOD set_address_locality.
    me->address_locality = i_address_locality.
  ENDMETHOD.


  METHOD set_address_region.
    me->address_region = i_address_region.
  ENDMETHOD.


  METHOD set_postal_code.
    me->postal_code = i_postal_code.
  ENDMETHOD.


  METHOD set_post_office_box_number.
    me->post_office_box_number = i_post_office_box_number.
  ENDMETHOD.


  METHOD set_street_address.
    me->street_address = i_street_address.
  ENDMETHOD.
ENDCLASS.