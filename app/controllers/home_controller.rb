class HomeController < ApplicationController
  def index
    @users = User.all.email
  end
end
