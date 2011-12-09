class Vote < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :value
  
  belongs_to :event;
end
