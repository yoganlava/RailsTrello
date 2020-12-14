Rails.application.routes.draw do
  root to: 'static#index'
  namespace :api, defaults: { format: :json } do
    get '/card_table/get_card_tables' => 'card_table#get_card_tables'
    get '/card/get_cards' => 'card#get_cards'
    get '/user/get_user_boards' => 'user#get_user_boards'
    get '/user/get_shared_boards' => 'user#get_shared_boards'
    get '/user/get_user_info' => 'user#get_user_info'
    post '/card_table/delete_tables' => 'card_table#delete_tables'
    post '/card/delete_cards' => 'card#delete_cards'
    post '/board_access/add_access' => 'board_access#add_access'
    post '/board_access/has_access' => 'board_access#has_access'
    post '/board/delete_board' => 'board#delete_board'
    post '/board/save' => 'board#save_board'
    post '/mail/send_contact' => 'contact#send_contact'
    resources :board
    resources :card
    resources :user
    resources :user_token
  end
  get '/*other', to: 'static#index', format: false

  # mount Vueonrails::Engine, at: 'vue'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
