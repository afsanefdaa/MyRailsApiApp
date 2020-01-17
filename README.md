# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.3.7

* System dependencies

* Configuration

* Database creation
It holds a dev db (sqlite)

* Database initialization

* How to run the test suite
bundle exec rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# MyRailsApiApp

1. add ruby 2.3.7, rails 5.2.3 and bundler gem globally 
2. run app in dev environment : rails s
3. go to admin panel by /admin - not authenticated 

apis:

`
GET    /shelves/:shelf_id/books                                                       
POST   /shelves/:shelf_id/books                                                      
GET    /shelves/:shelf_id/books/:id                                                  
PATCH  /shelves/:shelf_id/books/:id                                                   
PUT    /shelves/:shelf_id/books/:id                                                  
DELETE /shelves/:shelf_id/books/:id                                                 
GET    /shelves                                                                      
POST   /shelves                                                                     
GET    /shelves/:id                                                                  
PATCH  /shelves/:id                                                                   
PUT    /shelves/:id                                                                   
DELETE /shelves/:id
`                                                             