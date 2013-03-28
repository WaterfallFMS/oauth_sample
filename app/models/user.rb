class User < ActiveRecord::Base
  default_scope {Tenant.current_id != :admin ? where(:tenant_id => Tenant.current_id) : nil}
  serialize :details

  attr_accessible :email, :name

  belongs_to :tenant

  validates :name, :presence => true

  def self.from_omniauth(auth)
    update_from_omniauth(auth) || create_from_omniauth(auth)
  end
  def self.update_from_omniauth(auth)
    user = where(:provider => auth['provider']).where(:uid => auth['uid']).first
    return unless user

    user.details = auth
    user.name    = auth['info']['name']
    user.save
    user
  end
  def self.create_from_omniauth(auth)
    create! do |user|
      user.tenant_id = Tenant.current_id
      user.provider  = auth['provider']
      user.uid       = auth['uid']
      user.name      = auth['info']['name']
      user.details   = auth
    end
  end
end
