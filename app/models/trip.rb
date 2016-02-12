class Trip < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :time
  validates_presence_of :date
  validates_presence_of :source
  validates_presence_of :destination
end
