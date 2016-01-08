"! schema.org: GEOCOORDINATES The geographic coordinates of a place or event.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_geocoordinates DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_structuredvalue
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_address RETURNING VALUE(r_result) TYPE REF TO zcl_schema_postaladdress,
      set_address IMPORTING i_address TYPE REF TO zcl_schema_postaladdress,
      set_address_json IMPORTING i_address TYPE string,
      get_address_country RETURNING VALUE(r_result) TYPE string,
      set_address_country IMPORTING i_address_country TYPE string,
      get_elevation RETURNING VALUE(r_result) TYPE string,
      set_elevation IMPORTING i_elevation TYPE string,
      get_latitude RETURNING VALUE(r_result) TYPE string,
      set_latitude IMPORTING i_latitude TYPE string,
      get_longitude RETURNING VALUE(r_result) TYPE string,
      set_longitude IMPORTING i_longitude TYPE string,
      get_postal_code RETURNING VALUE(r_result) TYPE string,
      set_postal_code IMPORTING i_postal_code TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'GeoCoordinates'.

    DATA:
      "! Physical address of the item.
      address         TYPE REF TO zcl_schema_postaladdress,
      "! The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
      address_country TYPE string,
      "! The elevation of a location (WGS 84).
      elevation       TYPE string,
      "! The latitude of a location. For example 37.42242 (WGS 84).
      latitude        TYPE string,
      "! The longitude of a location. For example -122.08585 (WGS 84).
      longitude       TYPE string,
      "! The postal code. For example, 94043.
      postal_code     TYPE string.
ENDCLASS.



CLASS ZCL_SCHEMA_GEOCOORDINATES IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_address.
    r_result = me->address.
  ENDMETHOD.


  METHOD get_address_country.
    r_result = me->address_country.
  ENDMETHOD.


  METHOD get_elevation.
    r_result = me->elevation.
  ENDMETHOD.


  METHOD get_latitude.
    r_result = me->latitude.
  ENDMETHOD.


  METHOD get_longitude.
    r_result = me->longitude.
  ENDMETHOD.


  METHOD get_postal_code.
    r_result = me->postal_code.
  ENDMETHOD.


  METHOD set_address.
    me->address = i_address.
  ENDMETHOD.


  METHOD set_address_country.
    me->address_country = i_address_country.
  ENDMETHOD.


  METHOD set_address_json.
    me->address = NEW #( i_address ).
  ENDMETHOD.


  METHOD set_elevation.
    me->elevation = i_elevation.
  ENDMETHOD.


  METHOD set_latitude.
    me->latitude = i_latitude.
  ENDMETHOD.


  METHOD set_longitude.
    me->longitude = i_longitude.
  ENDMETHOD.


  METHOD set_postal_code.
    me->postal_code = i_postal_code.
  ENDMETHOD.
ENDCLASS.