Rails.application.routes.draw do
  root 'home#index'
  get 'home/question'
  post 'bazzinga/:id',to:"home#admin",as:"user_admin"
  post 'boomla/:id',to:"home#user",as:"admin_user"
  post 'vote/:answer_id/:vote_type',to:"questions#cast_vote",as:"voter"
  resources :questions do
    member do
      get "votecount",to:"questions#testing"
    end
  end
  

  post 'questions/answer/:id',to:'questions#answer',as:'answers_create'
  mount Ckeditor::Engine => '/ckeditor'
  post 'api/v1/auth_user' => 'authentication#authenticate_user'
  namespace :api do
  	namespace :v1 do
  		resources :service
  	end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
