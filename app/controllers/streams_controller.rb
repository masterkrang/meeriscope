class StreamsController < ApplicationController
  before_action :authenticate_user!
  def index
    @streams = current_user.streams
  end

  def new
    @stream = Stream.new
  end

  def create
    @stream = Stream.new stream_params.merge(user_id: current_user.id)
    if @stream.valid?
      @stream.save!
      redirect_to streams_path
    else
      render :new
    end
  end

  def stream_params
    params.require(:stream).permit(:title, :description, :location, :start_time, :category, :goal, :price, :url)
  end
end
