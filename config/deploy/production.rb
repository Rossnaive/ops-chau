set :stage,     :production
set :rails_env, :production
set :branch,    :master

server "130.211.237.172", port: "22", user: "deployer1", roles: [:web, :app, :db], primary: true

# Change these
set :repo_url,                "git@github.com:Rossnaive/ops-chau.git"
set :user,                    "deployer1"
set :application,             "chau-demo"
set :deploy_to,               "/var/www/#{fetch(:application)}"

# Don"t change these unless you know what you"re doing
set :pty,                     false
set :use_sudo,                false
set :deploy_via,              :remote_cache

#
set :rvm_ruby_version,        "2.5.5"

#
set :passenger_restart_with_touch, true
set :passenger_in_gemfile, true

##
set :ssh_options,             { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

##
# set :sidekiq_config,          "#{release_path}/config/sidekiq.yml"
# set :sidekiq_log,             "#{shared_path}/log/sidekiq.log"

## Linked Files & Directories (Default None):
set :linked_files,            %w{config/master.key config/database.yml}
set :linked_dirs,             %w{log tmp/pids tmp/cache tmp/sockets public/packs node_modules}

##
namespace :rakeman do
  task :invoke do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "#{ENV["task"]}"
        end
      end
    end
  end
end
