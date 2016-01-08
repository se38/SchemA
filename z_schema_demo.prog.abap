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
REPORT z_schema_demo.

DATA(organization) = NEW zcl_schema_organization( ).

organization->set_legal_name( 'SAP SE' ).
organization->set_founding_date( '19720401' ).
organization->set_address( NEW #( ) ).
organization->get_address( )->set_address_country( 'DE' ).
organization->get_address( )->set_address_locality( 'Walldorf' ).

DATA(founder) = organization->get_founder( ).
INSERT NEW zcl_schema_person( ) INTO TABLE founder ASSIGNING FIELD-SYMBOL(<founder>).
<founder>->set_name( 'Claus Wellenreuther' ).
INSERT NEW zcl_schema_person( ) INTO TABLE founder ASSIGNING <founder>.
<founder>->set_name( 'Hans-Werner Hector' ).
INSERT NEW zcl_schema_person( ) INTO TABLE founder ASSIGNING <founder>.
<founder>->set_name( 'Klaus Tschira' ).
INSERT NEW zcl_schema_person( ) INTO TABLE founder ASSIGNING <founder>.
<founder>->set_name( 'Dietmar Hopp' ).
INSERT NEW zcl_schema_person( ) INTO TABLE founder ASSIGNING <founder>.
<founder>->set_name( 'Hasso Plattner' ).
organization->set_founder( founder ).

cl_demo_output=>display_json( organization->get_json( ) ).