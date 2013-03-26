class Tenant::ApplicationController < ApplicationController
  around_filter :scope_current_tenant

  def index
  end

private
  def current_tenant
    @current_tenant ||= Tenant.find params[:tenant_id]
    @current_tenant = @current_tenant.becomes(@current_tenant.type.constantize).decorate
  end
  helper_method :current_tenant

  def scope_current_tenant
    Tenant.current_id = current_tenant.id
    yield
  ensure
    Tenant.current_id = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def decorated_user
    return unless current_user
    current_user.decorate
  end
  helper_method :decorated_user
end