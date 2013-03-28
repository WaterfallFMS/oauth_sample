class Tenant::SessionsController < Tenant::ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    self.session_user = user
    redirect_to tenant_root_path, notice: 'Signed in!'
  end

  def failure
  end

  def destroy
    self.session_user = nil
    redirect_to root_path, notice: "Signed out!"
  end
private
  def session_user=(user)
    session[:tenants] ||= {}
    session[:tenants][Tenant.current_id] ||= {}
    session[:tenants][Tenant.current_id][:user_id] = nil
    session[:tenants][Tenant.current_id][:user_id] = user.id unless user.nil?
  end
end