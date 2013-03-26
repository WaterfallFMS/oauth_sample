source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'pg'
gem 'jquery-rails'
gem 'bundler', '1.3.0.pre.5' # to match heroku

gem 'rails_admin'
gem 'cancan'
gem 'exception_notification'
gem 'haml'

gem 'draper' # to decorate tenants


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'heroku_san'

  gem 'pry-rails'
  gem 'guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'ruby_gntp'

  gem 'guard-bundler'
  gem 'guard-pow'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-spork'
  gem 'guard-brakeman'

  gem 'letter_opener'
  gem 'bullet'
end

group :test, :development do
  gem "rspec-rails", "~> 2.0"
  gem "capybara"    # for browser testing
  gem "poltergeist" # for JS testing
  gem 'spork'
  gem 'timecop'
  gem 'fakeweb'
  gem 'factory_girl_rails'
end

gem "devise"