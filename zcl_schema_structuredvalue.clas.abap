"! schema.org: STRUCTUREDVALUE Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_structuredvalue DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_intangible
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'StructuredValue'.

ENDCLASS.



CLASS ZCL_SCHEMA_STRUCTUREDVALUE IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.
ENDCLASS.
