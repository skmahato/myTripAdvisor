class Admin::HomeController < ApplicationController

  layout 'home'

  before_action :logged_in_user
  before_action :admin_user

  def help
  end

  def contact
  end

  def about
  end
end
