*&---------------------------------------------------------------------*
*&  Include  z_schema_constructor_super
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

    super->constructor( i_json ).
    INCLUDE z_schema_constructor.