Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  get 'home/question'

  post 'api/v1/auth_user' => 'authentication#authenticate_user'
  namespace :api do
  	namespace :v1 do
  		resources :service
  	end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
