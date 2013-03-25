namespace :heroku do
  desc 'Creates a new server'
  task :new do
    Rake::Task['heroku:create'].invoke
    Rake::Task['heroku:remotes'].invoke
    Rake::Task['heroku:config'].invoke
    Rake::Task['heroku:addons'].invoke
    Rake::Task['heroku:deploy'].invoke
  end
end