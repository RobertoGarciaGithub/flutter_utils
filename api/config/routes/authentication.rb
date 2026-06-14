namespace :authentication do
  resources :users, only: [:index, :create]
end
