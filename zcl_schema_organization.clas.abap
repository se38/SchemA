"! schema.org: ORGANIZATION An organization such as a school, NGO, corporation, club, etc.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_organization DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_thing
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_address RETURNING VALUE(r_result) TYPE REF TO zcl_schema_postaladdress,
      set_address IMPORTING i_address TYPE REF TO zcl_schema_postaladdress,
      set_address_json IMPORTING i_address TYPE string,
      get_aggregate_rating RETURNING VALUE(r_result) TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating IMPORTING i_aggregate_rating TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating_json IMPORTING i_aggregate_rating TYPE string,
      get_alumni RETURNING VALUE(r_result) TYPE REF TO zcl_schema_person,
      set_alumni IMPORTING i_alumni TYPE REF TO zcl_schema_person,
      set_alumni_json IMPORTING i_alumni TYPE string,
      get_area_served RETURNING VALUE(r_result) TYPE string,
      set_area_served IMPORTING i_area_served TYPE string,
      get_award RETURNING VALUE(r_result) TYPE string,
      set_award IMPORTING i_award TYPE string,
      get_brand RETURNING VALUE(r_result) TYPE REF TO zcl_schema_brand,
      set_brand IMPORTING i_brand TYPE REF TO zcl_schema_brand,
      set_brand_json IMPORTING i_brand TYPE string,
      get_contact_point RETURNING VALUE(r_result) TYPE REF TO zcl_schema_contactpoint,
      set_contact_point IMPORTING i_contact_point TYPE REF TO zcl_schema_contactpoint,
      set_contact_point_json IMPORTING i_contact_point TYPE string,
      get_department RETURNING VALUE(r_result) TYPE REF TO zcl_schema_organization,
      set_department IMPORTING i_department TYPE REF TO zcl_schema_organization,
      set_department_json IMPORTING i_department TYPE string,
      get_dissolution_date RETURNING VALUE(r_result) TYPE string,
      set_dissolution_date IMPORTING i_dissolution_date TYPE string,
      get_duns RETURNING VALUE(r_result) TYPE string,
      set_duns IMPORTING i_duns TYPE string,
      get_email RETURNING VALUE(r_result) TYPE string,
      set_email IMPORTING i_email TYPE string,
      get_employee RETURNING VALUE(r_result) TYPE REF TO zcl_schema_person,
      set_employee IMPORTING i_employee TYPE REF TO zcl_schema_person,
      set_employee_json IMPORTING i_employee TYPE string,
      get_event RETURNING VALUE(r_result) TYPE REF TO zcl_schema_event,
      set_event IMPORTING i_event TYPE REF TO zcl_schema_event,
      set_event_json IMPORTING i_event TYPE string,
      get_fax_number RETURNING VALUE(r_result) TYPE string,
      set_fax_number IMPORTING i_fax_number TYPE string,
      get_founder RETURNING VALUE(r_result) TYPE zcl_schema_thing=>tt_things,
      set_founder IMPORTING i_founder TYPE zcl_schema_thing=>tt_things,
      set_founder_json IMPORTING i_founder TYPE string,
      get_founding_date RETURNING VALUE(r_result) TYPE d,
      set_founding_date IMPORTING i_founding_date TYPE d,
      set_founding_date_json IMPORTING i_founding_date TYPE string,
      get_founding_location RETURNING VALUE(r_result) TYPE REF TO zcl_schema_place,
      set_founding_location IMPORTING i_founding_location TYPE REF TO zcl_schema_place,
      set_founding_location_json IMPORTING i_founding_location TYPE string,
      get_global_location_number RETURNING VALUE(r_result) TYPE string,
      set_global_location_number IMPORTING i_global_location_number TYPE string,
      get_has_pos RETURNING VALUE(r_result) TYPE REF TO zcl_schema_place,
      set_has_pos IMPORTING i_has_pos TYPE REF TO zcl_schema_place,
      set_has_pos_json IMPORTING i_has_pos TYPE string,
      get_isicv4 RETURNING VALUE(r_result) TYPE string,
      set_isicv4 IMPORTING i_isicv4 TYPE string,
      get_legal_name RETURNING VALUE(r_result) TYPE string,
      set_legal_name IMPORTING i_legal_name TYPE string,
      get_location RETURNING VALUE(r_result) TYPE REF TO zcl_schema_place,
      set_location IMPORTING i_location TYPE REF TO zcl_schema_place,
      set_location_json IMPORTING i_location TYPE string,
      get_logo RETURNING VALUE(r_result) TYPE REF TO zcl_schema_imageobject,
      set_logo IMPORTING i_logo TYPE REF TO zcl_schema_imageobject,
      set_logo_json IMPORTING i_logo TYPE string,
      get_member RETURNING VALUE(r_result) TYPE REF TO zcl_schema_organization,
      set_member IMPORTING i_member TYPE REF TO zcl_schema_organization,
      set_member_json IMPORTING i_member TYPE string,
      get_member_of RETURNING VALUE(r_result) TYPE REF TO zcl_schema_organization,
      set_member_of IMPORTING i_member_of TYPE REF TO zcl_schema_organization,
      set_member_of_json IMPORTING i_member_of TYPE string,
      get_naics RETURNING VALUE(r_result) TYPE string,
      set_naics IMPORTING i_naics TYPE string,
      get_number_of_employees RETURNING VALUE(r_result) TYPE i,
      set_number_of_employees IMPORTING i_number_of_employees TYPE i,
      get_owns RETURNING VALUE(r_result) TYPE REF TO zcl_schema_product,
      set_owns IMPORTING i_owns TYPE REF TO zcl_schema_product,
      set_owns_json IMPORTING i_owns TYPE string,
      get_parent_organization RETURNING VALUE(r_result) TYPE REF TO zcl_schema_organization,
      set_parent_organization IMPORTING i_parent_organization TYPE string,
      get_review RETURNING VALUE(r_result) TYPE REF TO zcl_schema_review,
      set_review IMPORTING i_review TYPE REF TO zcl_schema_review,
      set_review_json IMPORTING i_review TYPE string,
      get_sub_organization RETURNING VALUE(r_result) TYPE REF TO zcl_schema_organization,
      set_sub_organization IMPORTING i_sub_organization TYPE string,
      get_tax_id RETURNING VALUE(r_result) TYPE string,
      set_tax_id IMPORTING i_tax_id TYPE string,
      get_telephone RETURNING VALUE(r_result) TYPE string,
      set_telephone IMPORTING i_telephone TYPE string,
      get_vat_id RETURNING VALUE(r_result) TYPE string,
      set_vat_id IMPORTING i_vat_id TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Organization'.

    DATA:
      "! Physical address of the item.
      address                TYPE REF TO zcl_schema_postaladdress,
      "! The overall rating, based on a collection of reviews or ratings, of the item.
      aggregate_rating       TYPE REF TO zcl_schema_aggregaterating,
      "! Alumni of an organization. Inverse property: alumniOf.
      alumni                 TYPE REF TO zcl_schema_person,
      "! The geographic area where a service or offered item is provided. Supersedes serviceArea.
      area_served            TYPE string,
      "! An award won by or for this item. Supersedes awards.
      award                  TYPE string,
      "! The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
      brand                  TYPE REF TO zcl_schema_brand,
      "! A contact point for a person or organization. Supersedes contactPoints.
      contact_point          TYPE REF TO zcl_schema_contactpoint,
      "! A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.
      department             TYPE REF TO zcl_schema_organization,
      "! The date that this organization was dissolved.
      dissolution_date       TYPE string,
      "! The Dun & Bradstreet DUNS number for identifying an organization or business person.
      duns                   TYPE string,
      "! Email address.
      email                  TYPE string,
      "! Someone working for this organization. Supersedes employees.
      employee               TYPE REF TO zcl_schema_person,
      "! Upcoming or past event associated with this place, organization, or action. Supersedes events.
      event                  TYPE REF TO zcl_schema_event,
      "! The fax number.
      fax_number             TYPE string,
      "! A person who founded this organization. Supersedes founders.
      founder                TYPE zcl_schema_thing=>tt_things,
      "! The date that this organization was founded.
      founding_date          TYPE d,
      "! The place where the Organization was founded.
      founding_location      TYPE REF TO zcl_schema_place,
      "! The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
      global_location_number TYPE string,
      "! Points-of-Sales operated by the organization or person.
      has_pos                TYPE REF TO zcl_schema_place,
      "! The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
      isicv4                 TYPE string,
      "! The official name of the organization, e.g. the registered company name.
      legal_name             TYPE string,
      "! The location of for example where the event is happening, an organization is located, or where an action takes place.
      location               TYPE REF TO zcl_schema_place,
      "! An associated logo.
      logo                   TYPE REF TO zcl_schema_imageobject,
      "! A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals. Supersedes members, musicGroupMember. Inverse property: memberOf.
      member                 TYPE REF TO zcl_schema_organization,
      "! An Organization (or ProgramMembership) to which this Person or Organization belongs. Inverse property: member.
      member_of              TYPE REF TO zcl_schema_organization,
      "! The North American Industry Classification System (NAICS) code for a particular organization or business person.
      naics                  TYPE string,
      "! The number of employees in an organization e.g. business.
      number_of_employees    TYPE i,
      "! Products owned by the organization or person.
      owns                   TYPE REF TO zcl_schema_product,
      "! The larger organization that this organization is a branch of, if any. Supersedes branchOf. Inverse property: subOrganization.
      parent_organization    TYPE REF TO zcl_schema_organization,
      "! A review of the item. Supersedes reviews.
      review                 TYPE REF TO zcl_schema_review,
      "! A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific 'department' property. Inverse property: parentOrganization.
      sub_organization       TYPE REF TO zcl_schema_organization,
      "! The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
      tax_id                 TYPE string,
      "! The telephone number.
      telephone              TYPE string,
      "! The Value-added Tax ID of the organization or person.
      vat_id                 TYPE string.
ENDCLASS.



CLASS ZCL_SCHEMA_ORGANIZATION IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_address.
    r_result = me->address.
  ENDMETHOD.


  METHOD get_aggregate_rating.
    r_result = me->aggregate_rating.
  ENDMETHOD.


  METHOD get_alumni.
    r_result = me->alumni.
  ENDMETHOD.


  METHOD get_area_served.
    r_result = me->area_served.
  ENDMETHOD.


  METHOD get_award.
    r_result = me->award.
  ENDMETHOD.


  METHOD get_brand.
    r_result = me->brand.
  ENDMETHOD.


  METHOD get_contact_point.
    r_result = me->contact_point.
  ENDMETHOD.


  METHOD get_department.
    r_result = me->department.
  ENDMETHOD.


  METHOD get_dissolution_date.
    r_result = me->dissolution_date.
  ENDMETHOD.


  METHOD get_duns.
    r_result = me->duns.
  ENDMETHOD.


  METHOD get_email.
    r_result = me->email.
  ENDMETHOD.


  METHOD get_employee.
    r_result = me->employee.
  ENDMETHOD.


  METHOD get_event.
    r_result = me->event.
  ENDMETHOD.


  METHOD get_fax_number.
    r_result = me->fax_number.
  ENDMETHOD.


  METHOD get_founder.
    r_result = me->founder.
  ENDMETHOD.


  METHOD get_founding_date.
    r_result = me->founding_date.
  ENDMETHOD.


  METHOD get_founding_location.
    r_result = me->founding_location.
  ENDMETHOD.


  METHOD get_global_location_number.
    r_result = me->global_location_number.
  ENDMETHOD.


  METHOD get_has_pos.
    r_result = me->has_pos.
  ENDMETHOD.


  METHOD get_isicv4.
    r_result = me->isicv4.
  ENDMETHOD.


  METHOD get_legal_name.
    r_result = me->legal_name.
  ENDMETHOD.


  METHOD get_location.
    r_result = me->location.
  ENDMETHOD.


  METHOD get_logo.
    r_result = me->logo.
  ENDMETHOD.


  METHOD get_member.
    r_result = me->member.
  ENDMETHOD.


  METHOD get_member_of.
    r_result = me->member_of.
  ENDMETHOD.


  METHOD get_naics.
    r_result = me->naics.
  ENDMETHOD.


  METHOD get_number_of_employees.
    r_result = me->number_of_employees.
  ENDMETHOD.


  METHOD get_owns.
    r_result = me->owns.
  ENDMETHOD.


  METHOD get_parent_organization.
    r_result = me->parent_organization.
  ENDMETHOD.


  METHOD get_review.
    r_result = me->review.
  ENDMETHOD.


  METHOD get_sub_organization.
    r_result = me->sub_organization.
  ENDMETHOD.


  METHOD get_tax_id.
    r_result = me->tax_id.
  ENDMETHOD.


  METHOD get_telephone.
    r_result = me->telephone.
  ENDMETHOD.


  METHOD get_vat_id.
    r_result = me->vat_id.
  ENDMETHOD.


  METHOD set_address.
    me->address = i_address.
  ENDMETHOD.


  METHOD set_address_json.
    me->address = NEW #( i_address ).
  ENDMETHOD.


  METHOD set_aggregate_rating.
    me->aggregate_rating = i_aggregate_rating.
  ENDMETHOD.


  METHOD set_aggregate_rating_json.
    me->aggregate_rating = NEW #( i_aggregate_rating ).
  ENDMETHOD.


  METHOD set_alumni.
    me->alumni = i_alumni.
  ENDMETHOD.


  METHOD set_alumni_json.
    me->alumni = NEW #( i_alumni ).
  ENDMETHOD.


  METHOD set_area_served.
    me->area_served = i_area_served.
  ENDMETHOD.


  METHOD set_award.
    me->award = i_award.
  ENDMETHOD.


  METHOD set_brand.
    me->brand = i_brand.
  ENDMETHOD.


  METHOD set_brand_json.
    me->brand = NEW #( i_brand ).
  ENDMETHOD.


  METHOD set_contact_point.
    me->contact_point = i_contact_point.
  ENDMETHOD.


  METHOD set_contact_point_json.
    me->contact_point = NEW #( i_contact_point ).
  ENDMETHOD.


  METHOD set_department.
    me->department = i_department.
  ENDMETHOD.


  METHOD set_department_json.
    me->department = NEW #( i_department ).
  ENDMETHOD.


  METHOD set_dissolution_date.
    me->dissolution_date = i_dissolution_date.
  ENDMETHOD.


  METHOD set_duns.
    me->duns = i_duns.
  ENDMETHOD.


  METHOD set_email.
    me->email = i_email.
  ENDMETHOD.


  METHOD set_employee.
    me->employee = i_employee.
  ENDMETHOD.


  METHOD set_employee_json.
    me->employee = NEW #( i_employee ).
  ENDMETHOD.


  METHOD set_event.
    me->event = i_event.
  ENDMETHOD.


  METHOD set_event_json.
    me->event = NEW #( i_event ).
  ENDMETHOD.


  METHOD set_fax_number.
    me->fax_number = i_fax_number.
  ENDMETHOD.


  METHOD set_founder.
    me->founder = i_founder.
  ENDMETHOD.


  METHOD set_founder_json.
    me->founder = me->create_table(
      i_type = 'PERSON'
      i_json = i_founder
    ).
  ENDMETHOD.


  METHOD set_founding_date.
    me->founding_date = i_founding_date.
  ENDMETHOD.


  METHOD set_founding_date_json.
    DATA(founding_date) = i_founding_date.
    REPLACE ALL OCCURRENCES OF '-' IN founding_date WITH ``.
    me->founding_date = founding_date.
  ENDMETHOD.


  METHOD set_founding_location.
    me->founding_location = i_founding_location.
  ENDMETHOD.


  METHOD set_founding_location_json.
    me->founding_location = NEW #( i_founding_location ).
  ENDMETHOD.


  METHOD set_global_location_number.
    me->global_location_number = i_global_location_number.
  ENDMETHOD.


  METHOD set_has_pos.
    me->has_pos = i_has_pos.
  ENDMETHOD.


  METHOD set_has_pos_json.
    me->has_pos = NEW #( i_has_pos ).
  ENDMETHOD.


  METHOD set_isicv4.
    me->isicv4 = i_isicv4.
  ENDMETHOD.


  METHOD set_legal_name.
    me->legal_name = i_legal_name.
  ENDMETHOD.


  METHOD set_location.
    me->location = i_location.
  ENDMETHOD.


  METHOD set_location_json.
    me->location = NEW #( i_location ).
  ENDMETHOD.


  METHOD set_logo.
    me->logo = i_logo.
  ENDMETHOD.


  METHOD set_logo_json.
    me->logo = NEW #( i_logo ).
  ENDMETHOD.


  METHOD set_member.
    me->member = i_member.
  ENDMETHOD.


  METHOD set_member_json.
    me->member = NEW #( i_member ).
  ENDMETHOD.


  METHOD set_member_of.
    me->member_of = i_member_of.
  ENDMETHOD.


  METHOD set_member_of_json.
    me->member_of = NEW #( i_member_of ).
  ENDMETHOD.


  METHOD set_naics.
    me->naics = i_naics.
  ENDMETHOD.


  METHOD set_number_of_employees.
    me->number_of_employees = i_number_of_employees.
  ENDMETHOD.


  METHOD set_owns.
    me->owns = i_owns.
  ENDMETHOD.


  METHOD set_owns_json.
    me->owns = NEW #( i_owns ).
  ENDMETHOD.


  METHOD set_parent_organization.
    me->parent_organization = NEW #( i_parent_organization ).
  ENDMETHOD.


  METHOD set_review.
    me->review = i_review.
  ENDMETHOD.


  METHOD set_review_json.
    me->review = NEW #( i_review ).
  ENDMETHOD.


  METHOD set_sub_organization.
    me->sub_organization = NEW #( i_sub_organization ).
  ENDMETHOD.


  METHOD set_tax_id.
    me->tax_id = i_tax_id.
  ENDMETHOD.


  METHOD set_telephone.
    me->telephone = i_telephone.
  ENDMETHOD.


  METHOD set_vat_id.
    me->vat_id = i_vat_id.
  ENDMETHOD.
ENDCLASS.
