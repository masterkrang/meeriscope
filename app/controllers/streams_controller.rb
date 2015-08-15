class StreamsController < ApplicationController
  before_action :authenticate_user!, :except => :show
  def index
    @streams = current_user.streams
  end

  def new
    @stream = Stream.new
  end

  # public stream view
  def show
    @stream = Stream.find params[:id]
  end

  # private stream view
  def edit
    @stream = current_user.streams.find params[:id]
  end

  def upcoming
    @streams = current_user.streams.upcoming
  end

  def finished
    @streams = current_user.streams.finished
  end

  def canceled
    @streams = current_user.streams.canceled
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
