-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/wStqdy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "categories" (
    "category_id" VARCHAR(4)   NOT NULL,
    "category" VARCHAR(20)   NOT NULL,
    "last_updated" TIMESTAMP   NOT NULL default localtimestamp,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "sub_categories" (
    "subcategory_id" VARCHAR(7)   NOT NULL,
    "subcategory" VARCHAR(20)   NOT NULL,
    "last_updated" TIMESTAMP   NOT NULL default localtimestamp,
    CONSTRAINT "pk_sub_categories" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "email" VARCHAR(50)   NOT NULL,
    "last_updated" TIMESTAMP   NOT NULL default localtimestamp,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "campaigns" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(50)   NOT NULL,
    "description" VARCHAR(75)   NOT NULL,
    "goal" INTEGER   NOT NULL,
    "pledged" INTEGER   NOT NULL,
    "outcome" VARCHAR(10)   NOT NULL,
    "backers_count" INTEGER   NOT NULL,
    "country" VARCHAR(2)   NOT NULL,
    "currency" VARCHAR(3)   NOT NULL,
    "launced_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(4)   NOT NULL,
    "subcategory_id" VARCHAR(7)   NOT NULL,
    "last_updated" TIMESTAMP   NOT NULL default localtimestamp, 
    CONSTRAINT "pk_campaigns" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_category_id" FOREIGN KEY("category_id")
REFERENCES "categories" ("category_id");

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "sub_categories" ("subcategory_id");

