class HomeController < ApplicationController
  before_action :authenticate_user!, :except => :show

  def index
    @streams = current_user.bought_streams
  end
end
