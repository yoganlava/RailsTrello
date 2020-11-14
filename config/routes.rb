Rails.application.routes.draw do
  resources :cards
  resources :card_tables
  resources :board_accesses
  resources :boards
  # resources :users
  root to: 'users#index'
  get '/*path', to: 'users#index'
  mount Vueonrails::Engine, at: 'vue'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
