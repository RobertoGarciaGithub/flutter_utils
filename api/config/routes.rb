Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    draw :authentication
  end
end
