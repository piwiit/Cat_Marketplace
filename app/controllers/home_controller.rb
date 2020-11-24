class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[secret]
  def index
   end

  def secret
   end
end
