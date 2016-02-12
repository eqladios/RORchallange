class Membership < ActiveRecord::Base
  #attr_accessible :user_id, :trip_id
  belongs_to :user
  belongs_to :trip
end
