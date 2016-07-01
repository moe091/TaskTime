class Session < ActiveRecord::Base
  belongs_to :task
  attr_accessible :duration, :end, :start, :note
end
