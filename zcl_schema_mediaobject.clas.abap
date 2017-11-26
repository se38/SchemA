"! schema.org: MEDIAOBJECT An image, video, or audio object embedded in a web page. Note that a creative work may have many media objects associated with it on the same web page. For example, a page
"! about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_mediaobject DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_creativework
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_associated_article RETURNING VALUE(r_result) TYPE REF TO zcl_schema_newsarticle,
      set_associated_article IMPORTING i_associated_article TYPE REF TO zcl_schema_newsarticle,
      set_associated_article_json IMPORTING i_associated_article TYPE string,
      get_bitrate RETURNING VALUE(r_result) TYPE string,
      set_bitrate IMPORTING i_bitrate TYPE string,
      get_content_size RETURNING VALUE(r_result) TYPE string,
      set_content_size IMPORTING i_content_size TYPE string,
      get_content_url RETURNING VALUE(r_result) TYPE string,
      set_content_url IMPORTING i_content_url TYPE string,
      get_duration RETURNING VALUE(r_result) TYPE string,
      set_duration IMPORTING i_duration TYPE string,
      get_embed_url RETURNING VALUE(r_result) TYPE string,
      set_embed_url IMPORTING i_embed_url TYPE string,
      get_encodes_creative_work RETURNING VALUE(r_result) TYPE REF TO zcl_schema_creativework,
      set_encodes_creative_work IMPORTING i_encodes_creative_work TYPE REF TO zcl_schema_creativework,
      set_encodes_creative_work_json IMPORTING i_encodes_creative_work TYPE string,
      get_encoding_format RETURNING VALUE(r_result) TYPE string,
      set_encoding_format IMPORTING i_encoding_format TYPE string,
      get_expires RETURNING VALUE(r_result) TYPE d,
      set_expires IMPORTING i_expires TYPE d,
      set_expires_json IMPORTING i_expires TYPE string,
      get_height RETURNING VALUE(r_result) TYPE string,
      set_height IMPORTING i_height TYPE string,
      get_player_type RETURNING VALUE(r_result) TYPE string,
      set_player_type IMPORTING i_player_type TYPE string,
      get_upload_date RETURNING VALUE(r_result) TYPE d,
      set_upload_date IMPORTING i_upload_date TYPE d,
      set_upload_date_json IMPORTING i_upload_date TYPE string,
      get_width RETURNING VALUE(r_result) TYPE string,
      set_width IMPORTING i_width TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'MediaObject'.

    DATA:
      "! A NewsArticle associated with the Media Object.
      associated_article    TYPE REF TO zcl_schema_newsarticle,
      "! The bitrate of the media object.
      bitrate               TYPE string,
      "! File size in (mega/kilo) bytes.
      content_size          TYPE string,
      "! Actual bytes of the media object, for example the image file or video file.
      content_url           TYPE string,
      "! The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      duration              TYPE string,
      "! A URL pointing to a player for a specific video. In general, this is the information in the src element of an embed tag and should not be the same as the content of the loc tag.
      embed_url             TYPE string,
      "! The CreativeWork encoded by this media object.
      encodes_creative_work TYPE REF TO zcl_schema_creativework,
      "! mp3, mpeg4, etc.
      encoding_format       TYPE string,
      "! Date the content expires and is no longer useful or available. Useful for videos.
      expires               TYPE d,
      "! The height of the item.
      height                TYPE string,
      "! Player type required - for example, Flash or Silverlight.
      player_type           TYPE string,
      ""! The production company or studio responsible for the item e.g. series, video game, episode etc.
*      productionCompany type Organization,
      "! Date when this media object was uploaded to this site.
      upload_date           TYPE d,
      "! The width of the item.
      width                 TYPE string.

ENDCLASS.



CLASS ZCL_SCHEMA_MEDIAOBJECT IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_associated_article.
    r_result = me->associated_article.
  ENDMETHOD.


  METHOD get_bitrate.
    r_result = me->bitrate.
  ENDMETHOD.


  METHOD get_content_size.
    r_result = me->content_size.
  ENDMETHOD.


  METHOD get_content_url.
    r_result = me->content_url.
  ENDMETHOD.


  METHOD get_duration.
    r_result = me->duration.
  ENDMETHOD.


  METHOD get_embed_url.
    r_result = me->embed_url.
  ENDMETHOD.


  METHOD get_encodes_creative_work.
    r_result = me->encodes_creative_work.
  ENDMETHOD.


  METHOD get_encoding_format.
    r_result = me->encoding_format.
  ENDMETHOD.


  METHOD get_expires.
    r_result = me->expires.
  ENDMETHOD.


  METHOD get_height.
    r_result = me->height.
  ENDMETHOD.


  METHOD get_player_type.
    r_result = me->player_type.
  ENDMETHOD.


  METHOD get_upload_date.
    r_result = me->upload_date.
  ENDMETHOD.


  METHOD get_width.
    r_result = me->width.
  ENDMETHOD.


  METHOD set_associated_article.
    me->associated_article = i_associated_article.
  ENDMETHOD.


  METHOD set_associated_article_json.
    me->associated_article = NEW #( i_associated_article ).
  ENDMETHOD.


  METHOD set_bitrate.
    me->bitrate = i_bitrate.
  ENDMETHOD.


  METHOD set_content_size.
    me->content_size = i_content_size.
  ENDMETHOD.


  METHOD set_content_url.
    me->content_url = i_content_url.
  ENDMETHOD.


  METHOD set_duration.
    me->duration = i_duration.
  ENDMETHOD.


  METHOD set_embed_url.
    me->embed_url = i_embed_url.
  ENDMETHOD.


  METHOD set_encodes_creative_work.
    me->encodes_creative_work = i_encodes_creative_work.
  ENDMETHOD.


  METHOD set_encodes_creative_work_json.
    me->encodes_creative_work = NEW #( i_encodes_creative_work ).
  ENDMETHOD.


  METHOD set_encoding_format.
    me->encoding_format = i_encoding_format.
  ENDMETHOD.


  METHOD set_expires.
    me->expires = i_expires.
  ENDMETHOD.


  METHOD set_expires_json.
    DATA(expires) = i_expires.
    REPLACE ALL OCCURRENCES OF '-' IN expires WITH ``.
    me->expires = expires.
  ENDMETHOD.


  METHOD set_height.
    me->height = i_height.
  ENDMETHOD.


  METHOD set_player_type.
    me->player_type = i_player_type.
  ENDMETHOD.


  METHOD set_upload_date.
    me->upload_date = i_upload_date.
  ENDMETHOD.


  METHOD set_upload_date_json.
    DATA(upload_date) = i_upload_date.
    REPLACE ALL OCCURRENCES OF '-' IN upload_date WITH ``.
    me->upload_date = upload_date.
  ENDMETHOD.


  METHOD set_width.
    me->width = i_width.
  ENDMETHOD.
ENDCLASS.
