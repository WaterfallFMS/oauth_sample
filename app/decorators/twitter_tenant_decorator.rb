class TwitterTenantDecorator < TenantDecorator
  delegate_all

  def signin_link
    h.link_to 'Sign in with Twitter', "/auth/twitter?tenant_id=#{h.current_tenant.id}"
  end
end
