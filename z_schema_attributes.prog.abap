*&---------------------------------------------------------------------*
*&  Include  z_schema_attributes
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

**********************************************************************
* with describe_by_name we only get the attributes of the current
* class, but we need also the attributes for the super classes
* (complete hierarchy) -> this code must be included in all
* append_attributes methods:
* "INCLUDE z_schema_attributes_super."
**********************************************************************

    DATA descr TYPE REF TO cl_abap_classdescr.
    DATA classname TYPE seoclsname.
    classname = sy-repid(30).
    TRANSLATE classname USING '= '.
    descr ?= cl_abap_typedescr=>describe_by_name( classname ).
    CHECK descr IS BOUND.

    "*--- try to get values for all attributes of the current class ---*
    LOOP AT descr->attributes ASSIGNING FIELD-SYMBOL(<attribute>)
      WHERE is_constant IS INITIAL.

      "*--- call the getter method of this attribute ---*
      DATA attribute_value   TYPE string.
      DATA attribute_value_o TYPE REF TO zcl_schema_thing.
      DATA attribute_value_t TYPE zcl_schema_thing=>tt_things.

      DATA parameters TYPE abap_parmbind_tab.
      DATA parameter TYPE abap_parmbind.

      CLEAR parameters.
      parameter-name = 'R_RESULT'.

      parameter-value = COND #(
                                WHEN <attribute>-type_kind = 'r' THEN REF #( attribute_value_o )
                                WHEN <attribute>-type_kind = 'h' THEN REF #( attribute_value_t )
                                ELSE REF #( attribute_value )
                              ).

      INSERT parameter INTO TABLE parameters.

      DATA(method_name) = |GET_{ <attribute>-name }|.

      TRY.
          CALL METHOD (method_name)
            PARAMETER-TABLE parameters.
        CATCH cx_sy_dyn_call_illegal_method INTO DATA(zx) ##no_handler.
          CONTINUE.
      ENDTRY.

      "*--- attributes from the class ---*
      CASE <attribute>-type_kind.

        WHEN 'r'.       "an object itself

          CHECK attribute_value_o IS BOUND.

          DATA(json) = attribute_value_o->get_json( abap_true ).   "get JSON w/o leading context attribute
          CHECK json IS NOT INITIAL.

          json = '"' && /ui2/cl_json=>pretty_name( in = <attribute>-name ) && '": { ' && json && ' }'.
*          REPLACE 'result' IN json WITH /ui2/cl_json=>pretty_name( in = <attribute>-name ).

          IF c_json IS NOT INITIAL.
            c_json = c_json && | , |.
          ENDIF.

          c_json = c_json && json.

        WHEN 'h'.       "table of objects

          CHECK attribute_value_t IS NOT INITIAL.

          IF c_json IS NOT INITIAL.
            c_json = c_json && | , |.
          ENDIF.

          c_json = c_json && '"' && /ui2/cl_json=>pretty_name( in = <attribute>-name ) && '": ['.

          LOOP AT attribute_value_t INTO attribute_value_o.

            IF sy-tabix > 1.
              c_json = c_json && | , |.
            ENDIF.

            json = attribute_value_o->get_json( abap_true ).   "get JSON w/o surrounding brackets
            CHECK json IS NOT INITIAL.

            IF sy-tabix > 1.
              c_json = c_json && ','.
            ENDIF.

            c_json = c_json && '{ ' && json && ' }'.
          ENDLOOP.

          c_json = c_json && ' ]'.

        WHEN 'I'.                "Integer
          CHECK attribute_value CN '0 '.

          "*--- append attribute JSON ---*
          DATA(attribute_name) = /ui2/cl_json=>pretty_name( in = <attribute>-name ).

          IF c_json IS NOT INITIAL.
            c_json = c_json && ','.
          ENDIF.

          c_json = c_json && |"{ attribute_name }": { attribute_value }|.

        WHEN 'D'.                "Date
          CHECK attribute_value CN '0 '.

          "*--- append attribute JSON ---*
          attribute_name = /ui2/cl_json=>pretty_name( in = <attribute>-name ).

          IF c_json IS NOT INITIAL.
            c_json = c_json && ','.
          ENDIF.

          DATA date TYPE d.
          date = attribute_value.
          c_json = c_json && |"{ attribute_name }": "{ date DATE = ISO }"|.

        WHEN OTHERS.

          CHECK attribute_value IS NOT INITIAL.

          "*--- append attribute JSON ---*
          attribute_name = /ui2/cl_json=>pretty_name( in = <attribute>-name ).

          IF c_json IS NOT INITIAL.
            c_json = c_json && ','.
          ENDIF.

          c_json = c_json && |"{ attribute_name }": "{ attribute_value }"|.
      ENDCASE.

    ENDLOOP.