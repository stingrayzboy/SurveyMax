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
		Question <br>
			belongs to User <br>
			has many Answers<br>
		Answer<br>
			belongs to User<br>
			belongs to Question<br>
		User<br>
			has many Question<br>
			has many Answers<br>

	The Seeds file has the necessary models initialized with objects for demo perpose<br>




* This Application supports APIs
	to generate token visit http://localhost:3000/api/v1/auth_user<br>
	params{email:faraznoor75@gmail.com,password:boomla1!}<br>

	to call the API visit http://localhost:3000/api/v1/service<br>
	header{Bearer (Token From above)}<br>

* This Application uses multiple Gems
	Bootstrap4<br>
		For overall Styling<br>
	Kaminari<br>
		For Pagination<br>
	Devise
		For Session Management<br>
	Jwt<br>
		For API Tokens<br>
	Platipus<br>
		For Footer<br>
	Chartkick<br>
		To Create JS Charts<br>
	Groupdate<br>
		To Use Grouping queries<br>
