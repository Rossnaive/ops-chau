# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

## Defaults:
set :keep_releases, 5
set :log_level,     :debug
set :format,        :pretty
