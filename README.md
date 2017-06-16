# noteManager

An notes management with Ruby on Rails 5.

Demo: [https://guarded-retreat-81028.herokuapp.com/]

## Important: Sorry, I do not know what is the problem of registration and obtaining the token in heroku, so to accede enter here
https://guarded-retreat-81028.herokuapp.com/categoriesview

## Description
It uses rails 5 with the flag --api and integrates with vue.js 2 for the handling of the views.
It was necessary to call in application_controller.rb the ApplicationController <ActionController :: Base to be able to serve html
There are problems in the application (It does not have a method to close session and the use of the token is not so efficient, and still does not edit or delete records) We use Postgresql.

## Installation Instructions

### Install Rails

* Make sure you have a Ruby version > 2.3.3 installed in your system
* Install [RubyGems](https://rubygems.org/pages/download)
* run ```gem install rails -v 5.1.1```

### Download Repo

* Download this repo, and unzip it
* ``` cd notesManager``` to cd into the folder
* ``` bundle ```
* ``` rails db:create ```
* ``` rails db:migrate ```
* ``` RUN: rails s ```

### Test
* In the project root runs rspec - the application has 28 tests
