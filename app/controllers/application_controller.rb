class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :scope_current_tenant

private
  def scope_current_tenant
    Tenant.current_id = :admin if self.is_a? RailsAdmin::MainController
    yield
  end
end
