class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    session[:times_here] ||= 0
    session[:times_here] += 1
  end
  
  def about
  end
end
