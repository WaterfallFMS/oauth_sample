class Tenant::SessionsController < Tenant::ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to tenant_root_path, notice: 'Signed in!'
  end

  def failure
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end
end