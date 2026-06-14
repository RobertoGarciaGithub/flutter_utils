namespace :authentication do
  devise_for :users

  resources :users, only: [:index, :create]
end
