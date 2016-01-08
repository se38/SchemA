*&---------------------------------------------------------------------*
*&  Include  z_schema_constructor
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& SchemA
*& The schema.org ABAP Framework
*& Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community
*&
*& Project home: https://github.com/se38/SchemA
*&
*& Published under Apache License, Version 2.0
*& http://www.apache.org/licenses/LICENSE-2.0.html
*&---------------------------------------------------------------------*

    CHECK i_json IS NOT INITIAL.
    DATA(json_doc) = zcl_json_document=>create_with_json( i_json ).

**********************************************************************
* with describe_by_name we only get the attributes of the current
* class, but we need also the attributes for the super classes
* (complete hierarchy) -> this code must be included in all
* constructor methods:
* "INCLUDE z_schema_constructor_super."
**********************************************************************

    DATA descr TYPE REF TO cl_abap_classdescr.
    DATA classname TYPE c LENGTH 30.
    classname = sy-repid(30).
    TRANSLATE classname USING '= '.
    descr ?= cl_abap_typedescr=>describe_by_name( classname ).
    CHECK descr IS BOUND.

    "*--- try to get values for all attributes of the current class ---*
    LOOP AT descr->attributes ASSIGNING FIELD-SYMBOL(<attribute>) WHERE is_constant IS INITIAL.

      DATA(attribute_name) = to_lower( <attribute>-name ).
      REPLACE ALL OCCURRENCES OF '_' IN attribute_name WITH ``.

      "*--- read value from JSON ---*
      DATA attribute_value TYPE string.
      CLEAR attribute_value.
      attribute_value = json_doc->get_value( COND #( WHEN attribute_name = 'id' THEN |@id|
                                                     ELSE |{ attribute_name }|
                                           ) ).

      CHECK attribute_value IS NOT INITIAL.

      "*--- call the setter method of this attribute ---*
      DATA parameters TYPE abap_parmbind_tab.
      DATA parameter TYPE abap_parmbind.

      CLEAR parameters.
      parameter-name = |I_{ <attribute>-name }|.
      parameter-value = REF #( attribute_value ).
      INSERT parameter INTO TABLE parameters.

      IF <attribute>-type_kind = 'r'         "Object  -> call with JSON as data
      OR <attribute>-type_kind = 'h'         "Table   -> call with JSON as data
      OR <attribute>-type_kind = 'D'         "Date    -> call with JSON as data
      OR <attribute>-type_kind = 'I'.        "Integer -> call with JSON as data
        DATA(method_name) = |SET_{ <attribute>-name }_JSON|.
      ELSE.
        method_name = |SET_{ <attribute>-name }|.
      ENDIF.

      TRY.
          CALL METHOD (method_name)
            PARAMETER-TABLE parameters.
        CATCH cx_sy_dyn_call_illegal_method INTO DATA(zx) ##no_handler.
      ENDTRY.

    ENDLOOP.