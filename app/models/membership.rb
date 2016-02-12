class Membership < ActiveRecord::Base
  #validates :user_id, presence: true
  #validates :trip_id, presence: true
  belongs_to :user
  belongs_to :trip
end
