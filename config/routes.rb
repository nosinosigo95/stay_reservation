Rails.application.routes.draw do
  root 'rooms#top'
  post 'reservations/confirm', to:'reservations#confirm', as: :confirm_reservations
  post 'reservations/create', to: 'reservations#create', as: :reservations
  get 'reservations', to: 'reservations#index', as: :index_reservations
  
  get 'rooms', to: 'rooms#search', as: :search_rooms
  get 'rooms/new', to:'rooms#new', as: :new_rooms
  post 'rooms/new', to:'rooms#create'
  get 'rooms/own', to:'rooms#index', as: :rooms
  get 'rooms/:room_id', to:'rooms#show', as: :show_rooms
  get 'rooms/:room_id/edit', to:'rooms#edit', as: :edit_rooms
  post 'rooms/:room_id/update', to:'rooms#update', as: :update_rooms
  delete 'rooms/:room_id', to: 'rooms#destroy', as: :delete_rooms
  get 'users/sign_in', to:'sessions#new', as: :sign_in
  post 'users/sign_in', to:'sessions#create', as: :log_in
  delete 'users/sign_out', to:'sessions#destroy', as: :sign_out

  get 'users/sign_up', to:'users#sign_up', as: :sign_up
  post 'users/sign_up', to:'users#create', as: :create_user
  get 'users/account/', to:'users#account', as: :users_account
  get 'users/edit/', to:'users#edit', as: :edit_users
  post 'users/edit/', to:'users#update', as: :update_users
  get 'users/profile/', to: 'users#profile', as: :users_profile
  get 'users/profile/edit/', to: 'users#profile_edit', as: :edit_users_profile
  patch 'users/profile/update', to: 'users#profile_update', as: :update_users_profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
