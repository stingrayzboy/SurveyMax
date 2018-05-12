# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 
	2.4.0
* Rails Version
	5.1.6
* System dependencies
	
	You must have postgresql installed and runing on Port 5431 NOT 5432

* Configuration

* Database creation 
	Run rake db:setup OR rails db:setup

* Database initialization


# SurveyMax

* This application is created for demo purpose 

	Problem Description: Create an application that helps users to ask questions and gather answers

	Models: 
		Question 
			belongs to User 
			has many Answers
		Answer
			belongs to User
			belongs to Question
		User
			has many Question
			has many Answers

	The Seeds file has the necessary models initialized with objects for demo perpose




* This Application supports APIs
	to generate token visit http://localhost:3000/api/v1/auth_user
	params{email:faraznoor75@gmail.com,password:boomla1!}

	to call the API visit http://localhost:3000/api/v1/service
	header{Bearer (Token From above)}

* This Application uses multiple Gems
	Bootstrap4
		For overall Styling
	Kaminari
		For Pagination
	Devise
		For Session Management
	Jwt
		For API Tokens
	Platipus
		For Footer
	Chartkick
		To Create JS Charts
	Groupdate
		To Use Grouping queries
