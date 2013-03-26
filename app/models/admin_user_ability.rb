class AdminUserAbility
  include CanCan::Ability

  def initialize(admin_user)
    admin_user ||= AdminUser.new

    Rails.logger.info '-'*80
    Rails.logger.info 'AdminUserAbility'
    Rails.logger.info admin_user.inspect

    # to grant access to the dashboard
    can :access, :rails_admin
    can :dashboard

    # default to access to everything
    can :manage, :all

    cannot :new,  Tenant
    cannot :edit, Tenant
    can    [:new,:edit], MobileProTenant
    can    [:new,:edit], TwitterTenant
  end
end
