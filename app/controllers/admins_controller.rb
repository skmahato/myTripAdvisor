class AdminsController < ApplicationController

  layout "home"

  before_action :admin_user,     only: [:index]

  def index
  end
end
