"! schema.org: PLACE Entities that have a somewhat fixed, physical extension.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_place DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_thing
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_additional_property RETURNING VALUE(r_result) TYPE string,
      set_additional_property IMPORTING i_additional_property TYPE string,
      get_address RETURNING VALUE(r_result) TYPE REF TO zcl_schema_postaladdress,
      set_address IMPORTING i_address TYPE REF TO zcl_schema_postaladdress,
      set_address_json IMPORTING i_address TYPE string,
      get_aggregate_rating RETURNING VALUE(r_result) TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating IMPORTING i_aggregate_rating TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating_json IMPORTING i_aggregate_rating TYPE string,
      get_branch_code RETURNING VALUE(r_result) TYPE string,
      set_branch_code IMPORTING i_branch_code TYPE string,
      get_contained_in_place RETURNING VALUE(r_result) TYPE REF TO zcl_schema_place,
      set_contained_in_place IMPORTING i_contained_in_place TYPE REF TO zcl_schema_place,
      set_contained_in_place_json IMPORTING i_contained_in_place TYPE string,
      get_contains_place RETURNING VALUE(r_result) TYPE REF TO zcl_schema_place,
      set_contains_place IMPORTING i_contains_place TYPE string,
      get_event RETURNING VALUE(r_result) TYPE REF TO zcl_schema_event,
      set_event IMPORTING i_event TYPE REF TO zcl_schema_event,
      set_event_json IMPORTING i_event TYPE string,
      get_fax_number RETURNING VALUE(r_result) TYPE string,
      set_fax_number IMPORTING i_fax_number TYPE string,
      get_geo RETURNING VALUE(r_result) TYPE REF TO zcl_schema_geocoordinates,
      set_geo IMPORTING i_geo TYPE REF TO zcl_schema_geocoordinates,
      set_geo_json IMPORTING i_geo TYPE string,
      get_global_location_number RETURNING VALUE(r_result) TYPE string,
      set_global_location_number IMPORTING i_global_location_number TYPE string,
      get_has_map RETURNING VALUE(r_result) TYPE string,
      set_has_map IMPORTING i_has_map TYPE string,
      get_isicv4 RETURNING VALUE(r_result) TYPE string,
      set_isicv4 IMPORTING i_isicv4 TYPE string,
      get_logo RETURNING VALUE(r_result) TYPE REF TO zcl_schema_imageobject,
      set_logo IMPORTING i_logo TYPE REF TO zcl_schema_imageobject,
      set_logo_json IMPORTING i_logo TYPE string,
      get_photo RETURNING VALUE(r_result) TYPE REF TO zcl_schema_imageobject,
      set_photo IMPORTING i_photo TYPE string,
      get_review RETURNING VALUE(r_result) TYPE REF TO zcl_schema_review,
      set_review IMPORTING i_review TYPE REF TO zcl_schema_review,
      set_review_json IMPORTING i_review TYPE string,
      get_telephone RETURNING VALUE(r_result) TYPE string,
      set_telephone IMPORTING i_telephone TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Place'.

    DATA:
      "! A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
      "! Note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...)
      "! will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
      additional_property    TYPE string,
      "! Physical address of the item.
      address                TYPE REF TO zcl_schema_postaladdress,
      "! The overall rating, based on a collection of reviews or ratings, of the item.
      aggregate_rating       TYPE REF TO zcl_schema_aggregaterating,
      "! A short textual code (also called "store code") that uniquely identifies a place of business. The code is typically assigned by the parentOrganization and used in structured URLs.
      "! For example, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047 the code "3047" is a branchCode for a particular branch.
      branch_code            TYPE string,
      "! The basic containment relation between a place and one that contains it. Supersedes containedIn. Inverse property: containsPlace.
      contained_in_place     TYPE REF TO zcl_schema_place,
      "! The basic containment relation between a place and another that it contains. Inverse property: containsPlace.
      contains_place         TYPE REF TO zcl_schema_place,
      "! Upcoming or past event associated with this place, organization, or action. Supersedes events.
      event                  TYPE REF TO zcl_schema_event,
      "! The fax number.
      fax_number             TYPE string,
      "! The geo coordinates of the place.
      geo                    TYPE REF TO zcl_schema_geocoordinates,
      "! The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
      global_location_number TYPE string,
      "! A URL to a map of the place. Supersedes map, maps.
      has_map                TYPE string,
      "! The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
      isicv4                 TYPE string,
      "! An associated logo.
      logo                   TYPE REF TO zcl_schema_imageobject,
      "! A photograph of this place. Supersedes photos.
      photo                  TYPE REF TO zcl_schema_imageobject,
      "! A review of the item. Supersedes reviews.
      review                 TYPE REF TO zcl_schema_review,
      "! The telephone number.
      telephone              TYPE string.
ENDCLASS.



CLASS ZCL_SCHEMA_PLACE IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_additional_property.
    r_result = me->additional_property.
  ENDMETHOD.


  METHOD get_address.
    r_result = me->address.
  ENDMETHOD.


  METHOD get_aggregate_rating.
    r_result = me->aggregate_rating.
  ENDMETHOD.


  METHOD get_branch_code.
    r_result = me->branch_code.
  ENDMETHOD.


  METHOD get_contained_in_place.
    r_result = me->contained_in_place.
  ENDMETHOD.


  METHOD get_contains_place.
    r_result = me->contains_place.
  ENDMETHOD.


  METHOD get_event.
    r_result = me->event.
  ENDMETHOD.


  METHOD get_fax_number.
    r_result = me->fax_number.
  ENDMETHOD.


  METHOD get_geo.
    r_result = me->geo.
  ENDMETHOD.


  METHOD get_global_location_number.
    r_result = me->global_location_number.
  ENDMETHOD.


  METHOD get_has_map.
    r_result = me->has_map.
  ENDMETHOD.


  METHOD get_isicv4.
    r_result = me->isicv4.
  ENDMETHOD.


  METHOD get_logo.
    r_result = me->logo.
  ENDMETHOD.


  METHOD get_photo.
    r_result = me->photo.
  ENDMETHOD.


  METHOD get_review.
    r_result = me->review.
  ENDMETHOD.


  METHOD get_telephone.
    r_result = me->telephone.
  ENDMETHOD.


  METHOD set_additional_property.
    me->additional_property = i_additional_property.
  ENDMETHOD.


  METHOD set_address.
    me->address = i_address.
  ENDMETHOD.


  METHOD set_address_json.
    me->address = NEW #( i_address ).
  ENDMETHOD.


  METHOD set_aggregate_rating.
    me->aggregate_rating = i_aggregate_rating.
  ENDMETHOD.


  METHOD set_aggregate_rating_json.
    me->aggregate_rating = NEW #( i_aggregate_rating ).
  ENDMETHOD.


  METHOD set_branch_code.
    me->branch_code = i_branch_code.
  ENDMETHOD.


  METHOD set_contained_in_place.
    me->contained_in_place = i_contained_in_place.
  ENDMETHOD.


  METHOD set_contained_in_place_json.
    me->contained_in_place = NEW #( i_contained_in_place ).
  ENDMETHOD.


  METHOD set_contains_place.
    me->contains_place = NEW #( i_contains_place ).
  ENDMETHOD.


  METHOD set_event.
    me->event = i_event.
  ENDMETHOD.


  METHOD set_event_json.
    me->event = NEW #( i_event ).
  ENDMETHOD.


  METHOD set_fax_number.
    me->fax_number = i_fax_number.
  ENDMETHOD.


  METHOD set_geo.
    me->geo = i_geo.
  ENDMETHOD.


  METHOD set_geo_json.
    me->geo = NEW #( i_geo ).
  ENDMETHOD.


  METHOD set_global_location_number.
    me->global_location_number = i_global_location_number.
  ENDMETHOD.


  METHOD set_has_map.
    me->has_map = i_has_map.
  ENDMETHOD.


  METHOD set_isicv4.
    me->isicv4 = i_isicv4.
  ENDMETHOD.


  METHOD set_logo.
    me->logo = i_logo.
  ENDMETHOD.


  METHOD set_logo_json.
    me->logo = NEW #( i_logo ).
  ENDMETHOD.


  METHOD set_photo.
    me->photo = NEW #( i_photo ).
  ENDMETHOD.


  METHOD set_review.
    me->review = i_review.
  ENDMETHOD.


  METHOD set_review_json.
    me->review = NEW #( i_review ).
  ENDMETHOD.


  METHOD set_telephone.
    me->telephone = i_telephone.
  ENDMETHOD.
ENDCLASS.
