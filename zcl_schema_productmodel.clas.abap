"! schema.org: PRODUCTMODEL A datasheet or vendor specification of a product (in the sense of a prototypical description).
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_productmodel DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_product
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_is_variant_of RETURNING VALUE(r_result) TYPE REF TO zcl_schema_productmodel,
      set_is_variant_of IMPORTING i_is_variant_of TYPE REF TO zcl_schema_productmodel,
      set_is_variant_of_json IMPORTING i_is_variant_of TYPE string,
      get_predecessor_of RETURNING VALUE(r_result) TYPE REF TO zcl_schema_productmodel,
      set_predecessor_of IMPORTING i_predecessor_of TYPE REF TO zcl_schema_productmodel,
      set_predecessor_of_json IMPORTING i_predecessor_of TYPE string,
      get_successor_of RETURNING VALUE(r_result) TYPE REF TO zcl_schema_productmodel,
      set_successor_of IMPORTING i_successor_of TYPE REF TO zcl_schema_productmodel,
      set_successor_of_json IMPORTING i_successor_of TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'ProductModel'.

    DATA:
      "! A pointer to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive.
      is_variant_of  TYPE REF TO zcl_schema_productmodel,
      "! A pointer from a previous, often discontinued variant of the product to its newer variant.
      predecessor_of TYPE REF TO zcl_schema_productmodel,
      "! A pointer from a newer variant of a product to its previous, often discontinued predecessor.
      successor_of   TYPE REF TO zcl_schema_productmodel.
ENDCLASS.



CLASS ZCL_SCHEMA_PRODUCTMODEL IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_is_variant_of.
    r_result = me->is_variant_of.
  ENDMETHOD.


  METHOD get_predecessor_of.
    r_result = me->predecessor_of.
  ENDMETHOD.


  METHOD get_successor_of.
    r_result = me->successor_of.
  ENDMETHOD.


  METHOD set_is_variant_of.
    me->is_variant_of = i_is_variant_of.
  ENDMETHOD.


  METHOD set_is_variant_of_json.
    me->is_variant_of = NEW #( i_is_variant_of ).
  ENDMETHOD.


  METHOD set_predecessor_of.
    me->predecessor_of = i_predecessor_of.
  ENDMETHOD.


  METHOD set_predecessor_of_json.
    me->predecessor_of = NEW #( i_predecessor_of ).
  ENDMETHOD.


  METHOD set_successor_of.
    me->successor_of = i_successor_of.
  ENDMETHOD.


  METHOD set_successor_of_json.
    me->successor_of = NEW #( i_successor_of ).
  ENDMETHOD.
ENDCLASS.
