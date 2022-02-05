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

########################################################

After reading the exercise, I went to terminal and started a new api project with the comand `rails new social-network --api --datase=postgresql`. But just after configuring the database, I realised that the persistence of data wouldn't be necessary and removing database configuration the application could run faster, since it doesn't have to deal with ActiveRecord. Then, I asked Diego if it was OK to build the applications without database and he confirmed.

So, I reacreted the app with:
```
rais new social-networks --api --skip-active-record
```
And then created a new controller with `index` view with the command:
```
rails generate controller social_networks index
```
And configured the root path in the routes file.

