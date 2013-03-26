class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def show
    @tenant = Tenant.find params[:id]
    @tenant = @tenant.becomes(@tenant.type.constantize).decorate
  end
end