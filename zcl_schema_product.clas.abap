"! schema.org: PRODUCT Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.
"! <h1>SchemA</h1>
"! The schema.org ABAP Framework <br/>
"! Copyright (C) 2016 Uwe Fetzer together with the SCN ABAP community <br/>
"! <br/>
"! Project home: https://github.com/se38/SchemA <br/>
"! <br/>
"! Published under Apache License, Version 2.0 <br/>
"! http://www.apache.org/licenses/LICENSE-2.0.html <br/>
CLASS zcl_schema_product DEFINITION
  PUBLIC
  INHERITING FROM zcl_schema_thing
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_schema_thing.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_json TYPE string OPTIONAL,
      get_additional_property RETURNING VALUE(r_result) TYPE string,
      set_additional_property IMPORTING i_additional_property TYPE string,
      get_aggregate_rating RETURNING VALUE(r_result) TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating IMPORTING i_aggregate_rating TYPE REF TO zcl_schema_aggregaterating,
      set_aggregate_rating_json IMPORTING i_aggregate_rating TYPE string,
      get_award RETURNING VALUE(r_result) TYPE string,
      set_award IMPORTING i_award TYPE string,
      get_brand RETURNING VALUE(r_result) TYPE REF TO zcl_schema_brand,
      set_brand IMPORTING i_brand TYPE REF TO zcl_schema_brand,
      set_brand_json IMPORTING i_brand TYPE string,
      get_color RETURNING VALUE(r_result) TYPE text,
      set_color IMPORTING i_color TYPE text,
      get_depth RETURNING VALUE(r_result) TYPE string,
      set_depth IMPORTING i_depth TYPE string,
      get_gtin12 RETURNING VALUE(r_result) TYPE string,
      set_gtin12 IMPORTING i_gtin12 TYPE string,
      get_gtin13 RETURNING VALUE(r_result) TYPE string,
      set_gtin13 IMPORTING i_gtin13 TYPE string,
      get_gtin14 RETURNING VALUE(r_result) TYPE string,
      set_gtin14 IMPORTING i_gtin14 TYPE string,
      get_gtin8 RETURNING VALUE(r_result) TYPE string,
      set_gtin8 IMPORTING i_gtin8 TYPE string,
      get_height RETURNING VALUE(r_result) TYPE string,
      set_height IMPORTING i_height TYPE string,
      get_is_spare_part_for RETURNING VALUE(r_result) TYPE REF TO zcl_schema_product,
      set_is_spare_part_for IMPORTING i_is_spare_part_for TYPE REF TO zcl_schema_product,
      set_is_spare_part_for_json IMPORTING i_is_spare_part_for TYPE string,
      get_is_consumable_for RETURNING VALUE(r_result) TYPE REF TO zcl_schema_product,
      set_is_consumable_for IMPORTING i_is_consumable_for TYPE REF TO zcl_schema_product,
      set_is_consumable_for_json IMPORTING i_is_consumable_for TYPE string,
      get_is_related_to RETURNING VALUE(r_result) TYPE REF TO zcl_schema_product,
      set_is_related_to IMPORTING i_is_related_to TYPE REF TO zcl_schema_product,
      set_is_related_to_json IMPORTING i_is_related_to TYPE string,
      get_is_similar_to RETURNING VALUE(r_result) TYPE REF TO zcl_schema_product,
      set_is_similar_to IMPORTING i_is_similar_to TYPE string,
      get_logo RETURNING VALUE(r_result) TYPE REF TO zcl_schema_imageobject,
      set_logo IMPORTING i_logo TYPE REF TO zcl_schema_imageobject,
      set_logo_json IMPORTING i_logo TYPE string,
      get_manufacturer RETURNING VALUE(r_result) TYPE REF TO zcl_schema_organization,
      set_manufacturer IMPORTING i_manufacturer TYPE REF TO zcl_schema_organization,
      set_manufacturer_json IMPORTING i_manufacturer TYPE string,
      get_model RETURNING VALUE(r_result) TYPE REF TO zcl_schema_productmodel,
      set_model IMPORTING i_model TYPE REF TO zcl_schema_productmodel,
      set_model_json IMPORTING i_model TYPE string,
      get_mpn RETURNING VALUE(r_result) TYPE string,
      set_mpn IMPORTING i_mpn TYPE string,
      get_product_id RETURNING VALUE(r_result) TYPE string,
      set_product_id IMPORTING i_product_id TYPE string,
      get_production_date RETURNING VALUE(r_result) TYPE string,
      set_production_date IMPORTING i_production_date TYPE string,
      get_purchase_date RETURNING VALUE(r_result) TYPE string,
      set_purchase_date IMPORTING i_purchase_date TYPE string,
      get_release_date RETURNING VALUE(r_result) TYPE string,
      set_release_date IMPORTING i_release_date TYPE string,
      get_review RETURNING VALUE(r_result) TYPE REF TO zcl_schema_review,
      set_review IMPORTING i_review TYPE REF TO zcl_schema_review,
      set_review_json IMPORTING i_review TYPE string,
      get_sku RETURNING VALUE(r_result) TYPE string,
      set_sku IMPORTING i_sku TYPE string,
      get_weight RETURNING VALUE(r_result) TYPE string,
      set_weight IMPORTING i_weight TYPE string,
      get_width RETURNING VALUE(r_result) TYPE string,
      set_width IMPORTING i_width TYPE string.

  PROTECTED SECTION.
    METHODS:
      "*--- append attributes of this and all super classes as JSON ---*
      append_attributes REDEFINITION.

  PRIVATE SECTION.
    CLASS-DATA:
      type TYPE string VALUE 'Product'.

    DATA:
      "! A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
      "! Note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those
      additional_property TYPE string,
      "! The overall rating, based on a collection of reviews or ratings, of the item.
      aggregate_rating    TYPE REF TO zcl_schema_aggregaterating,
      "! An award won by or for this item. Supersedes awards.
      award               TYPE string,
      "! The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
      brand               TYPE REF TO zcl_schema_brand,
      "! The color of the product.
      color               TYPE text,
      "! The depth of the item.
      depth               TYPE string,
      "! The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items.
      "! See GS1 GTIN Summary for more details.
      gtin12              TYPE string,
      "! The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero.
      "! See GS1 GTIN Summary for more details.
      gtin13              TYPE string,
      "! The GTIN-14 code of the product, or the product to which the offer refers. See GS1 GTIN Summary for more details.
      gtin14              TYPE string,
      "! The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN. See GS1 GTIN Summary for more details.
      gtin8               TYPE string,
      "! The height of the item.
      height              TYPE string,
      "! A pointer to another product (or multiple products) for which this product is an accessory or spare part.
      is_spare_part_for   TYPE REF TO zcl_schema_product,
      "! A pointer to another product (or multiple products) for which this product is a consumable.
      is_consumable_for   TYPE REF TO zcl_schema_product,
      "! A pointer to another, somehow related product (or multiple products).
      is_related_to       TYPE REF TO zcl_schema_product,
      "! A pointer to another, functionally similar product (or multiple products).
      is_similar_to       TYPE REF TO zcl_schema_product,
      "! An associated logo.
      logo                TYPE REF TO zcl_schema_imageobject,
      "! The manufacturer of the product.
      manufacturer        TYPE REF TO zcl_schema_organization,
      "! The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong
      "! product identifiers via the gtin8/gtin13/gtin14 and mpn properties.
      model               TYPE REF TO zcl_schema_productmodel,
      "! The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
      mpn                 TYPE string,
      "! The product identifier, such as ISBN. For example: meta itemprop='productID' content='isbn:123-456-789'.
      product_id          TYPE string,
      "! The date of production of the item, e.g. vehicle.
      production_date     TYPE d,
      "! The date the item e.g. vehicle was purchased by the current owner.
      purchase_date       TYPE d,
      "! The release date of a product or product model. This can be used to distinguish the exact variant of a product.
      release_date        TYPE d,
      "! A review of the item. Supersedes reviews.
      review              TYPE REF TO zcl_schema_review,
      "! The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
      sku                 TYPE string,
      "! The weight of the product or person.
      weight              TYPE string,
      "! The width of the item.
      width               TYPE string.
ENDCLASS.



CLASS ZCL_SCHEMA_PRODUCT IMPLEMENTATION.


  METHOD append_attributes.
    INCLUDE z_schema_attributes_super.
  ENDMETHOD.


  METHOD constructor.
    INCLUDE z_schema_constructor_super.
  ENDMETHOD.


  METHOD get_additional_property.
    r_result = me->additional_property.
  ENDMETHOD.


  METHOD get_aggregate_rating.
    r_result = me->aggregate_rating.
  ENDMETHOD.


  METHOD get_award.
    r_result = me->award.
  ENDMETHOD.


  METHOD get_brand.
    r_result = me->brand.
  ENDMETHOD.


  METHOD get_color.
    r_result = me->color.
  ENDMETHOD.


  METHOD get_depth.
    r_result = me->depth.
  ENDMETHOD.


  METHOD get_gtin12.
    r_result = me->gtin12.
  ENDMETHOD.


  METHOD get_gtin13.
    r_result = me->gtin13.
  ENDMETHOD.


  METHOD get_gtin14.
    r_result = me->gtin14.
  ENDMETHOD.


  METHOD get_gtin8.
    r_result = me->gtin8.
  ENDMETHOD.


  METHOD get_height.
    r_result = me->height.
  ENDMETHOD.


  METHOD get_is_consumable_for.
    r_result = me->is_consumable_for.
  ENDMETHOD.


  METHOD get_is_related_to.
    r_result = me->is_related_to.
  ENDMETHOD.


  METHOD get_is_similar_to.
    r_result = me->is_similar_to.
  ENDMETHOD.


  METHOD get_is_spare_part_for.
    r_result = me->is_spare_part_for.
  ENDMETHOD.


  METHOD get_logo.
    r_result = me->logo.
  ENDMETHOD.


  METHOD get_manufacturer.
    r_result = me->manufacturer.
  ENDMETHOD.


  METHOD get_model.
    r_result = me->model.
  ENDMETHOD.


  METHOD get_mpn.
    r_result = me->mpn.
  ENDMETHOD.


  METHOD get_production_date.
    r_result = me->production_date.
  ENDMETHOD.


  METHOD get_product_id.
    r_result = me->product_id.
  ENDMETHOD.


  METHOD get_purchase_date.
    r_result = me->purchase_date.
  ENDMETHOD.


  METHOD get_release_date.
    r_result = me->release_date.
  ENDMETHOD.


  METHOD get_review.
    r_result = me->review.
  ENDMETHOD.


  METHOD get_sku.
    r_result = me->sku.
  ENDMETHOD.


  METHOD get_weight.
    r_result = me->weight.
  ENDMETHOD.


  METHOD get_width.
    r_result = me->width.
  ENDMETHOD.


  METHOD set_additional_property.
    me->additional_property = i_additional_property.
  ENDMETHOD.


  METHOD set_aggregate_rating.
    me->aggregate_rating = i_aggregate_rating.
  ENDMETHOD.


  METHOD set_aggregate_rating_json.
    me->aggregate_rating = NEW #( i_aggregate_rating ).
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


  METHOD set_color.
    me->color = i_color.
  ENDMETHOD.


  METHOD set_depth.
    me->depth = i_depth.
  ENDMETHOD.


  METHOD set_gtin12.
    me->gtin12 = i_gtin12.
  ENDMETHOD.


  METHOD set_gtin13.
    me->gtin13 = i_gtin13.
  ENDMETHOD.


  METHOD set_gtin14.
    me->gtin14 = i_gtin14.
  ENDMETHOD.


  METHOD set_gtin8.
    me->gtin8 = i_gtin8.
  ENDMETHOD.


  METHOD set_height.
    me->height = i_height.
  ENDMETHOD.


  METHOD set_is_consumable_for.
    me->is_consumable_for = i_is_consumable_for.
  ENDMETHOD.


  METHOD set_is_consumable_for_json.
    me->is_consumable_for = NEW #( i_is_consumable_for ).
  ENDMETHOD.


  METHOD set_is_related_to.
    me->is_related_to = i_is_related_to.
  ENDMETHOD.


  METHOD set_is_related_to_json.
    me->is_related_to = NEW #( i_is_related_to ).
  ENDMETHOD.


  METHOD set_is_similar_to.
    me->is_similar_to = NEW #( i_is_similar_to ).
  ENDMETHOD.


  METHOD set_is_spare_part_for.
    me->is_spare_part_for = i_is_spare_part_for.
  ENDMETHOD.


  METHOD set_is_spare_part_for_json.
    me->is_spare_part_for = NEW #( i_is_spare_part_for ).
  ENDMETHOD.


  METHOD set_logo.
    me->logo = i_logo.
  ENDMETHOD.


  METHOD set_logo_json.
    me->logo = NEW #( i_logo ).
  ENDMETHOD.


  METHOD set_manufacturer.
    me->manufacturer = i_manufacturer.
  ENDMETHOD.


  METHOD set_manufacturer_json.
    me->manufacturer = NEW #( i_manufacturer ).
  ENDMETHOD.


  METHOD set_model.
    me->model = i_model.
  ENDMETHOD.


  METHOD set_model_json.
    me->model = NEW #( i_model ).
  ENDMETHOD.


  METHOD set_mpn.
    me->mpn = i_mpn.
  ENDMETHOD.


  METHOD set_production_date.
    me->production_date = i_production_date.
  ENDMETHOD.


  METHOD set_product_id.
    me->product_id = i_product_id.
  ENDMETHOD.


  METHOD set_purchase_date.
    me->purchase_date = i_purchase_date.
  ENDMETHOD.


  METHOD set_release_date.
    me->release_date = i_release_date.
  ENDMETHOD.


  METHOD set_review.
    me->review = i_review.
  ENDMETHOD.


  METHOD set_review_json.
    me->review = NEW #( i_review ).
  ENDMETHOD.


  METHOD set_sku.
    me->sku = i_sku.
  ENDMETHOD.


  METHOD set_weight.
    me->weight = i_weight.
  ENDMETHOD.


  METHOD set_width.
    me->width = i_width.
  ENDMETHOD.
ENDCLASS.