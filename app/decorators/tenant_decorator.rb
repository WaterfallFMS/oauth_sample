class TenantDecorator < Draper::Decorator
  delegate_all

  def signin_link
  end
end
