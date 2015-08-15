class Stream < ActiveRecord::Base
  belongs_to :user
  has_many :tickets

  validates :title, :description, :start_time, :goal, :price, presence: true
  validates :start_time, date: {on_or_after: Date.today + 6.days}
  
end
