class Api::V1::ServiceController < ApiController
	before_action :authenticate_request!
	def index
		@question=Question.where(status:1).includes(:answers)
	end
end