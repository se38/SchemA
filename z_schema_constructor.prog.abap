*&---------------------------------------------------------------------*
*&  Include  z_schema_constructor
*&---------------------------------------------------------------------*

*/---------------------------------------------------------------------\
*| This file is part of SchemA                                         |
*| The schema.org ABAP Framework                                       |
*|---------------------------------------------------------------------|
*| Copyright 2016 SchemA project members                               |
*|                                                                     |
*| Licensed under the Apache License, Version 2.0 (the "License");     |
*| you may not use this file except in compliance with the License.    |
*| You may obtain a copy of the License at                             |
*|                                                                     |
*|     http://www.apache.org/licenses/LICENSE-2.0                      |
*|                                                                     |
*| Unless required by applicable law or agreed to in writing, software |
*| distributed under the License is distributed on an "AS IS" BASIS,   |
*| WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or     |
*| implied.                                                            |
*| See the License for the specific language governing permissions and |
*| limitations under the License.                                      |
*\---------------------------------------------------------------------/
*/---------------------------------------------------------------------\
*| /  __ \           | |      (_) |         | |                        |
*| | /  \/ ___  _ __ | |_ _ __ _| |__  _   _| |_ ___  _ __ ___         |
*| | |    / _ \| '_ \| __| '__| | '_ \| | | | __/ _ \| '__/ __|        |
*| | \__/\ (_) | | | | |_| |  | | |_) | |_| | || (_) | |  \__ \        |
*|  \____/\___/|_| |_|\__|_|  |_|_.__/ \__,_|\__\___/|_|  |___/        |
*|---------------------------------------------------------------------|
*| Lead Developers : Uwe Fetzer (Twitter @se38)                        |
*|---------------------------------------------------------------------|
*| For a full list of contributors visit:                              |
*| project homepage: https://github.com/se38/SchemA                    |
*\---------------------------------------------------------------------/

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
