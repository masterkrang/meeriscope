class LandingController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @streams = Stream.upcoming
  end
end
