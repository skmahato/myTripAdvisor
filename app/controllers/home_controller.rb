class HomeController < ApplicationController

  layout 'home'
  before_action :twitter_logged


  def help
  end

  def contact
  end

  def about
  end
end
