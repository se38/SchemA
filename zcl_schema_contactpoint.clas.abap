"! schema.org: CONTACTPOINT A contact point-for example, a Customer Complaints department.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_contactpoint DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_structuredvalue
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_area_served RETURNING VALUE(r_result) TYPE string,
      set_area_served IMPORTING i_area_served TYPE string,
      get_available_language RETURNING VALUE(r_result) TYPE REF TO zcl_schema_language,
      set_available_language IMPORTING i_available_language TYPE REF TO zcl_schema_language,
      set_available_language_json IMPORTING i_available_language TYPE string,
      get_contact_type RETURNING VALUE(r_result) TYPE string,
      set_contact_type IMPORTING i_contact_type TYPE string,
      get_email RETURNING VALUE(r_result) TYPE string,
      set_email IMPORTING i_email TYPE string,
      get_fax_number RETURNING VALUE(r_result) TYPE string,
      set_fax_number IMPORTING i_fax_number TYPE string,
      get_product_supported RETURNING VALUE(r_result) TYPE REF TO zcl_schema_product,
      set_product_supported IMPORTING i_product_supported TYPE string,
      get_telephone RETURNING VALUE(r_result) TYPE string,
      set_telephone IMPORTING i_telephone TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'ContactPoint'.

    DATA:
      "! The geographic area where a service or offered item is provided. Supersedes serviceArea.
      area_served        TYPE string,
      "! A language someone may use with the item.
      available_language TYPE REF TO zcl_schema_language,
      "! A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.
      contact_type       TYPE string,
      "! Email address.
      email              TYPE string,
      "! The fax number.
      fax_number         TYPE string,
      "! The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. "iPhone") or a general category of
      "! products or services (e.g. "smartphones").
      product_supported  TYPE REF TO zcl_schema_product,
      "! The telephone number.
      telephone          TYPE string.
ENDCLASS.



CLASS ZCL_SCHEMA_CONTACTPOINT IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_area_served.
    r_result = me->area_served.
  ENDMETHOD.


  METHOD get_available_language.
    r_result = me->available_language.
  ENDMETHOD.


  METHOD get_contact_type.
    r_result = me->contact_type.
  ENDMETHOD.


  METHOD get_email.
    r_result = me->email.
  ENDMETHOD.


  METHOD get_fax_number.
    r_result = me->fax_number.
  ENDMETHOD.


  METHOD get_product_supported.
    r_result = me->product_supported.
  ENDMETHOD.


  METHOD get_telephone.
    r_result = me->telephone.
  ENDMETHOD.


  METHOD set_area_served.
    me->area_served = i_area_served.
  ENDMETHOD.


  METHOD set_available_language.
    me->available_language = i_available_language.
  ENDMETHOD.


  METHOD set_available_language_json.
    me->available_language = NEW #( i_available_language ).
  ENDMETHOD.


  METHOD set_contact_type.
    me->contact_type = i_contact_type.
  ENDMETHOD.


  METHOD set_email.
    me->email = i_email.
  ENDMETHOD.


  METHOD set_fax_number.
    me->fax_number = i_fax_number.
  ENDMETHOD.


  METHOD set_product_supported.
    me->product_supported = NEW #( i_product_supported ).
  ENDMETHOD.


  METHOD set_telephone.
    me->telephone = i_telephone.
  ENDMETHOD.
ENDCLASS.