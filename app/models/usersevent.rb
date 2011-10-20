class Usersevent < ActiveRecord::Base
  
  attr_accessible :user_id, :event_id, :admin
  
  belongs_to :event  # foreign key - programmer_id
  belongs_to :user
end
