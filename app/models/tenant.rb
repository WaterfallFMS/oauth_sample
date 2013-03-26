class Tenant < ActiveRecord::Base
  attr_accessible :name, :owner_id, :type

  belongs_to :owner, :class_name => 'User'
end
