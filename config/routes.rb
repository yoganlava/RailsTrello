Rails.application.routes.draw do
  root to: 'static#index'
  get '/*path', to: 'static#index'
  namespace :api, defaults: { format: :json } do
    resources :board
    resources :card
    resources :card_table
    resources :user
  end
  mount Vueonrails::Engine, at: 'vue'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
