module Api
  module Authentication
    class BaseController < ApplicationController
      before_action :authenticate_user!
    end
  end
end
