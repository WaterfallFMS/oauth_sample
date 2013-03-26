class Tenant < ActiveRecord::Base
  attr_accessible :name, :owner_id, :type

  belongs_to :owner, :class_name => 'User'

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end
end
