# Если вы используете другую систему управления зависимостями,
# закомментируйте эту строку.
require 'bundler/capistrano'

## Чтобы не хранить database.yml в системе контроля версий, поместите
## dayabase.yml в shared-каталог проекта на сервере и раскомментируйте
## следующие строки.

after "deploy:update_code", :copy_database_config
task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

load 'deploy/assets'

ssh_options[:forward_agent] = true
set :application,     'fe-vrn'
set :deploy_server,   'lithium.locum.ru'
set :bundle_without,  [:development, :test]
set :user,            'hosting_niksan'
set :login,           'niksan'
set :use_sudo,        false
set :deploy_to,       "/home/#{user}/projects/#{application}"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{application}.#{login}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
role :web,            deploy_server
role :app,            deploy_server
role :db,             deploy_server, :primary => true
set :rvm_ruby_string, '2.0.0'
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake" 
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"
set :scm,             :git
set :repository,      'git@github.com:niksan/fe-vrn.git'

before 'deploy:finalize_update', 'set_current_release'
task :set_current_release, :roles => :app do
    set :current_release, latest_release
end

set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"

namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] &amp;&amp; kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] &amp;&amp; kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end
