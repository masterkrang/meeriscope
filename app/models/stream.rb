class Stream < ActiveRecord::Base
  validates :title, :description, :start_time, :goal, :price, presence: true

  validates :start_time, date: {on_or_after: Date.today + 16.days}
  
end
