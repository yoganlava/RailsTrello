Rails.application.routes.draw do
  root to: 'static#index'
  namespace :api, defaults: { format: :json } do
    resources :board
    resources :card
    get 'get_card_tables' => 'card_table#get_card_tables'
    get 'get_cards' => 'card#get_cards'
    get 'user/get_user_boards' => 'user#get_user_boards'
    get 'user/get_shared_boards' => 'user#get_shared_boards'
    get 'get_user_info' => 'user#get_user_info'
    post 'delete_tables' => 'card_table#delete_tables'
    post 'delete_cards' => 'card#delete_cards'
    post 'add_access' => 'board#add_access'
    post '/board/has_access' => 'board_access#has_access'
    post '/board/delete_board' => 'board#delete_board'
    post 'save' => 'board#save_board'
    post 'mail' => 'contact#send_contact'
    resources :user
    resources :user_token
  end
  get '/*other', to: 'static#index'

  mount Vueonrails::Engine, at: 'vue'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
