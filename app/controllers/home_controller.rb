class HomeController < ApplicationController
  def index
    #@users = User.all.email
    #redirect_to params[:url]
    #binding.pry
    render "#{params[:page]}"
    Topics.where(title: params[:title])
  end
end
