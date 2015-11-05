set :application, 'unep-marine'

set :stages, %w(demo)
set :default_stage, 'demo'
require 'capistrano/ext/multistage'

set :deploy_via, :remote_cache

set :rails_env, 'production'
set :deploy_env, 'production'

set :scm, :git
set :repository, "git@github.com:unepwcmc/marine-portal.git"
set :copy_exclude, [".git"]
set :use_sudo, false
ssh_options[:forward_agent] = true

set :user, "lunar"
set(:deploy_to) { "/home/#{fetch(:user)}/apps/#{fetch(:application)}" }

set :rvm_type, :system
set(:rvm_ruby_string) { "2.1.1@#{fetch(:application)}" }
set(:bundle_dir) { File.join(fetch(:rvm_path), "gems/ruby-#{fetch(:rvm_ruby_string)}") }
set(:bundle_cmd) { File.join(fetch(:rvm_path), "wrappers/ruby-#{fetch(:rvm_ruby_string)}/bundle") }

set :shared_files, %w(config/database.yml config/unicorn.rb)

set :whenever_command, "bundle exec whenever"
set :whenever_environment, defer { stage }

require 'rvm/capistrano'
require 'capistrano-unicorn'
require 'bundler/capistrano'

set :keep_releases, 3
after "deploy:update_code", "deploy:cleanup"
before 'deploy:assets:precompile', 'deploy:symlink_shared'

after 'deploy:restart', 'unicorn:reload'

namespace :deploy do
  desc "Symlink shared files/directories"
  task :symlink_shared do
    fetch(:shared_files).each do |file|
      run "ln -nfs #{shared_path}/#{file} #{release_path}/#{file}"
    end

    run "ln -nfs #{shared_path}/public/pdfs #{release_path}/public/pdfs"
  end
end

namespace :unicorn do
  task :restart, :roles => :app, :except => {:no_release => true} do
    unicorn.stop
    unicorn.start
  end
end

# Changes HUP to USR2
namespace :unicorn do
  desc 'Reload Unicorn'
  task :reload, :roles => :app, :except => {:no_release => true} do
    run <<-END
      set -x;
      if #{unicorn_is_running?}; then
        echo "Reloading Unicorn...";
        #{unicorn_send_signal('USR2')};
      else
        #{start_unicorn}
      fi;
    END
  end
end
