class TwitterTenantDecorator < TenantDecorator
  delegate_all

  def signin_link
    h.link_to 'Sign in with Twitter', h.root_path
  end
end
