Rails.application.routes.draw do
  get 'rooms/:room_id/edit', to:'rooms#edit', as: :rooms_edit
  post 'rooms/:room_id/update', to:'rooms#update', as: :rooms_update
  get 'rooms/:room_id', to:'rooms#show', as: :rooms_show
  get 'rooms/index', to:'rooms#index', as: :rooms
  get 'rooms/new', to:'rooms#new'
  post 'rooms/new', to:'rooms#create'

  get 'users/sign_in', to:'sessions#new', as: :sign_in
  post 'users/sign_in', to:'sessions#create', as: :log_in
  delete 'users/sign_out', to:'sessions#destroy', as: :sign_out

  get 'users/sign_up', to:'users#sign_up', as: :sign_up
  post 'users/sign_up', to:'users#create', as: :create_user
  get 'users/account/', to:'users#account', as: :users_account
  get 'users/edit/', to:'users#edit', as: :users_edit
  post 'users/edit/', to:'users#update', as: :users_update
  get 'users/profile/', to: 'users#profile', as: :users_profile
  get 'users/profile/edit/', to: 'users#profile_edit', as: :users_profile_edit
  patch 'users/profile/update', to: 'users#profile_update', as: :users_profile_update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
