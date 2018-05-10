json.array!(@question) do |question|
	json.(question, :alphaid,:user_id,:created_at)
	json.answers question.answers,:alphaid,:user_id,:created_at
end