class AuthenticationController < ApiController
  def authenticate_user
    user = ServiceUser.find_for_database_authentication(email: params[:email])
    if user
      if user.valid_password?(params[:apiKey])
          render json: payload(user)
      else
        render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
      end
    else
      render json:{errors: ['Not a Service User']},status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end