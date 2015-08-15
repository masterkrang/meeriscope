class StreamsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @stream = Stream.new
  end
end
