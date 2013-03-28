class Tenant::ApplicationController < ApplicationController

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
    return unless session[:tenants] && session[:tenants][Tenant.current_id]
    @current_user ||= User.find(session[:tenants][Tenant.current_id][:user_id]).decorate
  rescue => e
    logger.info 'Excpetion was raised'
    logger.info e.inspect
    logger.info e.backtrace.join "\n"
    nil
  end
  helper_method :current_user

  def tenant_root_path
    tenant_path current_tenant
  end
end