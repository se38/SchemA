*&---------------------------------------------------------------------*
*&  Include  z_schema_constructor_super
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

    super->constructor( i_json ).
    INCLUDE z_schema_constructor.