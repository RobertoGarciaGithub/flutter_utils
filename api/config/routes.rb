Rails.application.routes.draw do
  namespace :api do
    draw :authentication
  end
end
