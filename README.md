# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

rails g scaffold Customer name:string country:string address:string city:string

rails g scaffold FilamentCount name:string

rails g scaffold Merge name:string

rails g scaffold Plant name:string country:string

rails g scaffold SpecificProblem name:string 

rails g scaffold YarnType name:string

quantity
rails g scaffold Report count:integer code:string autor:string product_name:string customer_report_date:date report_start_date:date plant:references title:string value:float decitex:float denier:float yarn_type:references merge:references filament_count:references segment:string customer_end_use:string invoice_invista:string invoice_mag:string quantity_shipped:float quantity_affected:float
return_potential:float return_value:float claim_potential:float claim_value:float customer:references reporter:string phone:string email:string source:string specific_problem:references description_problem:text preliminary_investigation:text preliminary_conclusions:text research_results:text conclusions_plant:text action_plan:text close_claim:boolean date_close:date validation_claim:text


