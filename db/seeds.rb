faraz=User.create(
	name:"Faraz Noor",
	email:"faraznoor75@gmail.com",
	password:"boomla1!",
	password_confirmation:"boomla1!",
	roles:"admin"
)
puts "Faraz created as an admin"

amir=User.create(
	name:"Amir Parkar",
	email:"amirparkar@gmail.com",
	password:"boomla1!",
	password_confirmation:"boomla1!"
)
puts "Amir Created as a user"

15.times do |user|
	User.create(
	name:"Amir Parkar#{user}",
	email:"amirparkar#{user}@gmail.com",
	password:"boomla1!",
	password_confirmation:"boomla1!"
)
end

3.times do|question|
	Question.create!(
		name:"Question number #{question+1}?",
		user:faraz,
		status:1)
end
puts "Faraz Created 3 questions"

3.times do|question|
	Question.create!(
		name:"Question number #{question+4}?",
		user:amir,
		status:1)
end
puts "Amir Created 3 questions"

3.times do|answer|
	Answer.create!(
		name:"Answer number #{answer+1}!!!",
		user:amir,
		question:faraz.questions.last,
		vote_count:0)
end
puts "Amir answered last question 3 times"

3.times do|answer|
	Answer.create!(
		name:"Answer number #{answer+1}!!!",
		user:amir,
		question:faraz.questions.first,
		vote_count:0)
end
puts "Amir answered first question 3 times"


3.times do|answer|
	Answer.create!(
		name:"Answer number #{answer+1}!!!",
		user:faraz,
		question:amir.questions.first,
		vote_count:0)
end
puts "Amir answered last question 3 times"

3.times do|answer|
	Answer.create!(
		name:"Answer number #{answer+1}!!!",
		user:faraz,
		question:amir.questions.last,
		vote_count:0)
end
puts "Amir answered first question 3 times"