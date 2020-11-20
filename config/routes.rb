Rails.application.routes.draw do
  root to: 'static#index'
  namespace :api, defaults: { format: :json } do
    resources :board
    resources :card
    resources :card_table
    resources :user
    resources :user_token
  end
  get '/*other', to: 'static#index'

  mount Vueonrails::Engine, at: 'vue'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
