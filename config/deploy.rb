# config valid only for current version of Capistrano
lock '3.8.2'

set :application, 'spinner'
set :repo_url, 'https://github.com/aschmitz/spinner'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/spinner'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/cable.yml',
  'config/database.yml',
  'config/secrets.yml',
  'Passengerfile.json'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for keep_releases is 5
# set :keep_releases, 5

after 'deploy:publishing', 'systemd:spinner_mopidy:restart'
