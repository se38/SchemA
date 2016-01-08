"! --------------------------------------------------------------------
"!
"! SchemA
"! The schema.org ABAP Framework
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community
"!
"! Project home: https://github.com/se38/SchemA
"!
"! Published under Apache License, Version 2.0
"! http://www.apache.org/licenses/LICENSE-2.0.html
"!
"! --------------------------------------------------------------------
CLASS zcl_schema_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS:
      "! Create the schema.org object according to the type parameter
      "!
      "! @parameter i_json | schema.org object as JSON string
      "! @parameter r_object | schema.org object
      create
        IMPORTING i_json          TYPE string
        RETURNING VALUE(r_object) TYPE REF TO zcl_schema_thing.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SCHEMA_MAIN IMPLEMENTATION.


  METHOD create.

    DATA(json_doc) = zcl_json_document=>create_with_json( i_json ).
    DATA(types_doc) = zcl_json_document=>create_with_json( json_doc->get_value( '@type' ) ).

    WHILE types_doc->get_next( ) IS NOT INITIAL.

      DATA(type) = to_upper( types_doc->get_json( ) ).
      CHECK type <> 'THING'.

      "*--- try to create an object with this type ---*
      DATA(object_type) = |ZCL_SCHEMA_{ type }|.

      TRY.
          CREATE OBJECT r_object TYPE (object_type)
            EXPORTING i_json = i_json.
        CATCH cx_sy_create_object_error.
          CONTINUE.
      ENDTRY.

      EXIT.    "a class with this type found
    ENDWHILE.

    "*--- no class with this type found -> create a THING ---*
    IF r_object IS NOT BOUND.
      r_object = NEW zcl_schema_thing( i_json ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.