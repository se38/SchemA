"! schema.org: EVENT An event happening at a certain time and location, such as a concert, lecture, or festival. Ticketing information may be added via the 'offers' property. Repeated events may be structured as separate Event objects.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_event DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_thing
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_aggregate_rating RETURNING VALUE(r_result) TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating IMPORTING i_aggregate_rating TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating_json IMPORTING i_aggregate_rating TYPE string,
      get_attendee RETURNING VALUE(r_result) TYPE REF TO zcl_schema_person,
      set_attendee IMPORTING i_attendee TYPE REF TO zcl_schema_person,
      set_attendee_json IMPORTING i_attendee TYPE string,
      get_door_time RETURNING VALUE(r_result) TYPE string,
      set_door_time IMPORTING i_door_time TYPE string,
      get_duration RETURNING VALUE(r_result) TYPE string,
      set_duration IMPORTING i_duration TYPE string,
      get_end_date RETURNING VALUE(r_result) TYPE string,
      set_end_date IMPORTING i_end_date TYPE string,
      get_event_status RETURNING VALUE(r_result) TYPE string,
      set_event_status IMPORTING i_event_status TYPE string,
      get_in_language RETURNING VALUE(r_result) TYPE REF TO zcl_schema_language,
      set_in_language IMPORTING i_in_language TYPE REF TO zcl_schema_language,
      set_in_language_json IMPORTING i_in_language TYPE string,
      get_location RETURNING VALUE(r_result) TYPE REF TO zcl_schema_postaladdress,
      set_location IMPORTING i_location TYPE REF TO zcl_schema_postaladdress,
      set_location_json IMPORTING i_location TYPE string,
      get_organizer RETURNING VALUE(r_result) TYPE REF TO zcl_schema_organization,
      set_organizer IMPORTING i_organizer TYPE REF TO zcl_schema_organization,
      set_organizer_json IMPORTING i_organizer TYPE string,
      get_performer RETURNING VALUE(r_result) TYPE REF TO zcl_schema_person,
      set_performer IMPORTING i_performer TYPE REF TO zcl_schema_person,
      set_performer_json IMPORTING i_performer TYPE string,
      get_previous_start_date RETURNING VALUE(r_result) TYPE d,
      set_previous_start_date IMPORTING i_previous_start_date TYPE d,
      get_recorded_in RETURNING VALUE(r_result) TYPE REF TO zcl_schema_creativework,
      set_recorded_in IMPORTING i_recorded_in TYPE REF TO zcl_schema_creativework,
      set_recorded_in_json IMPORTING i_recorded_in TYPE string,
      get_review RETURNING VALUE(r_result) TYPE REF TO zcl_schema_review,
      set_review IMPORTING i_review TYPE REF TO zcl_schema_review,
      set_review_json IMPORTING i_review TYPE string,
      get_start_date RETURNING VALUE(r_result) TYPE d,
      set_start_date IMPORTING i_start_date TYPE d,
      get_sub_event RETURNING VALUE(r_result) TYPE REF TO zcl_schema_event,
      set_sub_event IMPORTING i_sub_event TYPE REF TO zcl_schema_event,
      set_sub_event_json IMPORTING i_sub_event TYPE string,
      get_super_event RETURNING VALUE(r_result) TYPE REF TO zcl_schema_event,
      set_super_event IMPORTING i_super_event TYPE string,
      get_typical_age_range RETURNING VALUE(r_result) TYPE string,
      set_typical_age_range IMPORTING i_typical_age_range TYPE string,
      get_work_featured RETURNING VALUE(r_result) TYPE REF TO zcl_schema_creativework,
      set_work_featured IMPORTING i_work_featured TYPE REF TO zcl_schema_creativework,
      set_work_featured_json IMPORTING i_work_featured TYPE string,
      get_work_performed RETURNING VALUE(r_result) TYPE REF TO zcl_schema_creativework,
      set_work_performed IMPORTING i_work_performed TYPE REF TO zcl_schema_creativework,
      set_work_performed_json IMPORTING i_work_performed TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Event'.

    DATA:
      "! The overall rating, based on a collection of reviews or ratings, of the item.
      aggregate_rating    TYPE REF TO zcl_schema_aggregaterating,
      "! A person or organization attending the event. Supersedes attendees.
      attendee            TYPE REF TO zcl_schema_person,
      "! The time admission will commence.
      door_time           TYPE string,
      "! The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      duration            TYPE string,
      "! The end date and time of the item (in ISO 8601 date format).
      end_date            TYPE d,
      "! An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.
      event_status        TYPE string,
      "! The language of the content or performance or used in an action. Please use one of the language codes from the IETF BCP 47 standard. Supersedes language.
      in_language         TYPE REF TO zcl_schema_language,
      "! The location of for example where the event is happening, an organization is located, or where an action takes place.
      location            TYPE REF TO zcl_schema_postaladdress,
      "! An organizer of an Event.
      organizer           TYPE REF TO zcl_schema_organization,
      "! A performer at the event - for example, a presenter, musician, musical group or actor. Supersedes performers.
      performer           TYPE REF TO zcl_schema_person,
      "! Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events,
      "! the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.
      previous_start_date TYPE d,
      "! The CreativeWork that captured all or part of this Event. Inverse property: recordedAt.
      recorded_in         TYPE REF TO zcl_schema_creativework,
      "! A review of the item. Supersedes reviews.
      review              TYPE REF TO zcl_schema_review,
      "! The start date and time of the item (in ISO 8601 date format).
      start_date          TYPE d,
      "! An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference. Supersedes subEvents.
      sub_event           TYPE REF TO zcl_schema_event,
      "! An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.
      super_event         TYPE REF TO zcl_schema_event,
      "! The typical expected age range, e.g. '7-9', '11-'.
      typical_age_range   TYPE string,
      "! A work featured in some event, e.g. exhibited in an ExhibitionEvent. Specific subproperties are available for workPerformed (e.g. a play), or a workPresented (a Movie at a ScreeningEvent).
      work_featured       TYPE REF TO zcl_schema_creativework,
      "! A work performed in some event, for example a play performed in a TheaterEvent.
      work_performed      TYPE REF TO zcl_schema_creativework.
ENDCLASS.



CLASS ZCL_SCHEMA_EVENT IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_aggregate_rating.
    r_result = me->aggregate_rating.
  ENDMETHOD.


  METHOD get_attendee.
    r_result = me->attendee.
  ENDMETHOD.


  METHOD get_door_time.
    r_result = me->door_time.
  ENDMETHOD.


  METHOD get_duration.
    r_result = me->duration.
  ENDMETHOD.


  METHOD get_end_date.
    r_result = me->end_date.
  ENDMETHOD.


  METHOD get_event_status.
    r_result = me->event_status.
  ENDMETHOD.


  METHOD get_in_language.
    r_result = me->in_language.
  ENDMETHOD.


  METHOD get_location.
    r_result = me->location.
  ENDMETHOD.


  METHOD get_organizer.
    r_result = me->organizer.
  ENDMETHOD.


  METHOD get_performer.
    r_result = me->performer.
  ENDMETHOD.


  METHOD get_previous_start_date.
    r_result = me->previous_start_date.
  ENDMETHOD.


  METHOD get_recorded_in.
    r_result = me->recorded_in.
  ENDMETHOD.


  METHOD get_review.
    r_result = me->review.
  ENDMETHOD.


  METHOD get_start_date.
    r_result = me->start_date.
  ENDMETHOD.


  METHOD get_sub_event.
    r_result = me->sub_event.
  ENDMETHOD.


  METHOD get_super_event.
    r_result = me->super_event.
  ENDMETHOD.


  METHOD get_typical_age_range.
    r_result = me->typical_age_range.
  ENDMETHOD.


  METHOD get_work_featured.
    r_result = me->work_featured.
  ENDMETHOD.


  METHOD get_work_performed.
    r_result = me->work_performed.
  ENDMETHOD.


  METHOD set_aggregate_rating.
    me->aggregate_rating = i_aggregate_rating.
  ENDMETHOD.


  METHOD set_aggregate_rating_json.
    me->aggregate_rating = NEW #( i_aggregate_rating ).
  ENDMETHOD.


  METHOD set_attendee.
    me->attendee = i_attendee.
  ENDMETHOD.


  METHOD set_attendee_json.
    me->attendee = NEW #( i_attendee ).
  ENDMETHOD.


  METHOD set_door_time.
    me->door_time = i_door_time.
  ENDMETHOD.


  METHOD set_duration.
    me->duration = i_duration.
  ENDMETHOD.


  METHOD set_end_date.
    me->end_date = i_end_date.
  ENDMETHOD.


  METHOD set_event_status.
    me->event_status = i_event_status.
  ENDMETHOD.


  METHOD set_in_language.
    me->in_language = i_in_language.
  ENDMETHOD.


  METHOD set_in_language_json.
    me->in_language = NEW #( i_in_language ).
  ENDMETHOD.


  METHOD set_location.
    me->location = i_location.
  ENDMETHOD.


  METHOD set_location_json.
    me->location = NEW #( i_location ).
  ENDMETHOD.


  METHOD set_organizer.
    me->organizer = i_organizer.
  ENDMETHOD.


  METHOD set_organizer_json.
    me->organizer = NEW #( i_organizer ).
  ENDMETHOD.


  METHOD set_performer.
    me->performer = i_performer.
  ENDMETHOD.


  METHOD set_performer_json.
    me->performer = NEW #( i_performer ).
  ENDMETHOD.


  METHOD set_previous_start_date.
    me->previous_start_date = i_previous_start_date.
  ENDMETHOD.


  METHOD set_recorded_in.
    me->recorded_in = i_recorded_in.
  ENDMETHOD.


  METHOD set_recorded_in_json.
    me->recorded_in = NEW #( i_recorded_in ).
  ENDMETHOD.


  METHOD set_review.
    me->review = i_review.
  ENDMETHOD.


  METHOD set_review_json.
    me->review = NEW #( i_review ).
  ENDMETHOD.


  METHOD set_start_date.
    me->start_date = i_start_date.
  ENDMETHOD.


  METHOD set_sub_event.
    me->sub_event = i_sub_event.
  ENDMETHOD.


  METHOD set_sub_event_json.
    me->sub_event = NEW #( i_sub_event ).
  ENDMETHOD.


  METHOD set_super_event.
    me->super_event = NEW #( i_super_event ).
  ENDMETHOD.


  METHOD set_typical_age_range.
    me->typical_age_range = i_typical_age_range.
  ENDMETHOD.


  METHOD set_work_featured.
    me->work_featured = i_work_featured.
  ENDMETHOD.


  METHOD set_work_featured_json.
    me->work_featured = NEW #( i_work_featured ).
  ENDMETHOD.


  METHOD set_work_performed.
    me->work_performed = i_work_performed.
  ENDMETHOD.


  METHOD set_work_performed_json.
    me->work_performed = NEW #( i_work_performed ).
  ENDMETHOD.
ENDCLASS.