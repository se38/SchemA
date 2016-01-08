*&---------------------------------------------------------------------*
*& Report z_schema_demo
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