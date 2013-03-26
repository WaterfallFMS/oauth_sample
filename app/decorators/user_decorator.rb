class UserDecorator < Draper::Decorator
  delegate_all

  def signout_link
    h.link_to 'Sign out', h.root_path
  end
end
