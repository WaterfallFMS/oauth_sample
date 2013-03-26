class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def show
    redirect_to tenant_landing_path(params[:id])
  end
end