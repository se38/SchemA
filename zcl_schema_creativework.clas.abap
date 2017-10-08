"! schema.org: The most generic kind of creative work, including books, movies, photographs, software programs, etc.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_creativework DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_thing
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_about RETURNING VALUE(r_result) TYPE REF TO zcl_schema_thing,
      set_about IMPORTING i_about TYPE REF TO zcl_schema_thing,
      set_about_json IMPORTING i_about TYPE string,
      get_accessibility_api RETURNING VALUE(r_result) TYPE string,
      set_accessibility_api IMPORTING i_accessibility_api TYPE string,
      get_accessibility_control RETURNING VALUE(r_result) TYPE string,
      set_accessibility_control IMPORTING i_accessibility_control TYPE string,
      get_accessibility_feature RETURNING VALUE(r_result) TYPE string,
      set_accessibility_feature IMPORTING i_accessibility_feature TYPE string,
      get_accessibility_hazard RETURNING VALUE(r_result) TYPE string,
      set_accessibility_hazard IMPORTING i_accessibility_hazard TYPE string,
      get_accountable_person RETURNING VALUE(r_result) TYPE REF TO zcl_schema_person,
      set_accountable_person IMPORTING i_accountable_person TYPE REF TO zcl_schema_person,
      set_accountable_person_json IMPORTING i_accountable_person TYPE string,
      get_aggregate_rating RETURNING VALUE(r_result) TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating IMPORTING i_aggregate_rating TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating_json IMPORTING i_aggregate_rating TYPE string,
      get_alternative_headline RETURNING VALUE(r_result) TYPE string,
      set_alternative_headline IMPORTING i_alternative_headline TYPE string,
      get_license RETURNING VALUE(r_result) TYPE string,
      set_license IMPORTING i_license TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'CreativeWork'.

    DATA:
      "! The subject matter of the content.
      about                 TYPE REF TO zcl_schema_thing,
      "! Indicates that the resource is compatible with the referenced accessibility API (WebSchemas wiki lists possible values).
      accessibility_api     TYPE string,
      "! Identifies input methods that are sufficient to fully control the described resource (WebSchemas wiki lists possible values).
      accessibility_control TYPE string,
      "! Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility (WebSchemas wiki lists possible values).
      accessibility_feature TYPE string,
      "! A characteristic of the described resource that is physiologically dangerous to some users. Related to WCAG 2.0 guideline 2.3 (WebSchemas wiki lists possible values).
      accessibility_hazard  TYPE string,
      "! Specifies the Person that is legally accountable for the CreativeWork.
      accountable_person    TYPE REF TO zcl_schema_person,
      "! The overall rating, based on a collection of reviews or ratings, of the item.
      aggregate_rating      TYPE REF TO zcl_schema_aggregaterating,
      "! A secondary title of the CreativeWork.
      alternative_headline  TYPE string,
      "! A license document that applies to this content, typically indicated by URL.
      license               TYPE string.

ENDCLASS.



CLASS ZCL_SCHEMA_CREATIVEWORK IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_about.
    r_result = me->about.
  ENDMETHOD.


  METHOD get_accessibility_api.
    r_result = me->accessibility_api.
  ENDMETHOD.


  METHOD get_accessibility_control.
    r_result = me->accessibility_control.
  ENDMETHOD.


  METHOD get_accessibility_feature.
    r_result = me->accessibility_feature.
  ENDMETHOD.


  METHOD get_accessibility_hazard.
    r_result = me->accessibility_hazard.
  ENDMETHOD.


  METHOD get_accountable_person.
    r_result = me->accountable_person.
  ENDMETHOD.


  METHOD get_aggregate_rating.
    r_result = me->aggregate_rating.
  ENDMETHOD.


  METHOD get_alternative_headline.
    r_result = me->alternative_headline.
  ENDMETHOD.


  METHOD get_license.
    r_result = me->license.
  ENDMETHOD.


  METHOD set_about.
    me->about = i_about.
  ENDMETHOD.


  METHOD set_about_json.
    me->about = NEW #( i_about ).
  ENDMETHOD.


  METHOD set_accessibility_api.
    me->accessibility_api = i_accessibility_api.
  ENDMETHOD.


  METHOD set_accessibility_control.
    me->accessibility_control = i_accessibility_control.
  ENDMETHOD.


  METHOD set_accessibility_feature.
    me->accessibility_feature = i_accessibility_feature.
  ENDMETHOD.


  METHOD set_accessibility_hazard.
    me->accessibility_hazard = i_accessibility_hazard.
  ENDMETHOD.


  METHOD set_accountable_person.
    me->accountable_person = i_accountable_person.
  ENDMETHOD.


  METHOD set_accountable_person_json.
    me->accountable_person = NEW #(  i_accountable_person ).
  ENDMETHOD.


  METHOD set_aggregate_rating.
    me->aggregate_rating = i_aggregate_rating.
  ENDMETHOD.


  METHOD set_aggregate_rating_json.
    me->aggregate_rating = NEW #(  i_aggregate_rating ).
  ENDMETHOD.


  METHOD set_alternative_headline.
    me->alternative_headline = i_alternative_headline.
  ENDMETHOD.


  METHOD set_license.
    me->license = i_license.
  ENDMETHOD.
ENDCLASS.
