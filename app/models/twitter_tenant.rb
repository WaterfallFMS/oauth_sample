class TwitterTenant < Tenant
  rails_admin do |config|
    config.edit do
      configure :type do
        hide
      end
    end
  end
end