class User < ActiveRecord::Base
  default_scope {where(:tenant_id => Tenant.current_id)}

  attr_accessible :email, :name

  belongs_to :tenant

  validates :name, :presence => true
end
