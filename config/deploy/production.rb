set :application,                "MyApp"
set :domain,                     "ip or domain"
set :repository,                 "git@github.com:nirds/myapp.git"
set :branch,                     "master"
set :user,                       "deploy"
set :use_sudo,                   false
set :scm,                        "git"
set :deploy_to,                  "/var/www"

set :production_db_config,       "/var/www/shared/production.database.yml"
set :production_files_dir,       "/var/www/shared/files"

set :rails_env, 'production'

require "rvm/capistrano"
set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p392@RoRAdmin'

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

namespace :deploy do
  task :create_sym_links do
    run "cd #{release_path}/config && ln -s #{production_db_config} database.yml"
    run "cd #{release_path} && ln -s /var/www/shared/exports exports"
    run "cd #{release_path}/tmp && ln -s #{production_files_dir} files"
  end

  task :start, :roles => :app do
    run "touch #{release_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{release_path}/tmp/restart.txt"
  end
end

after "deploy:update_code",  "deploy:create_sym_links"
after "deploy",              "rvm:trust_rvmrc"
