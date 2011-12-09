class Event < ActiveRecord::Base
  attr_accessible :name, :date

  has_many :usersevent
  has_many :user, :through => :usersevent
  has_many :vote
end
