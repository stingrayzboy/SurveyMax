json.array!(@question) do |question|
	json.(question, :alphaid,:created_at,:name)
	json.user question.user.name
	json.answers(question.answers) do |answer|
		json.(answer,:alphaid,:created_at,:name)
		json.user answer.user.name
	end
	#json.answers question.answers,:alphaid,:user_id,:created_at
end