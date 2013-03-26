class TenantDecorator < Draper::Decorator
  delegate_all

  def signin_link
  end

  def signout_link
    h.link_to 'Sign out', h.signout_path(:tenant_id => h.current_tenant.id)
  end
end
