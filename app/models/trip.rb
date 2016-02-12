class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  validates_presence_of :time
  validates_presence_of :date
  validates_presence_of :source
  validates_presence_of :destination
end
