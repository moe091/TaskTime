class Task < ActiveRecord::Base
  belongs_to :user
  has_many :sessions
  # attr_accessible :title, :body
 
  scope :ending_by, lambda {|time| where("end_date < ?", time)}
end
