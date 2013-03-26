class User < ActiveRecord::Base
  attr_accessible :email, :name, :type

  has_many :tenants, :foreign_key => :owner_id

  validates :name, :presence => true
  validates :email, :presence => true
end
