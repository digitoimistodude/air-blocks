set :application, "air-blocks"
set :repo_url, "git@github.com:digitoimistodude/air-blocks.git"
set :branch, "master"
set :log_level, :debug
set :linked_files, %w{.env}
set :linked_dirs, %w{media}
set :composer_install_flags, '--no-dev --prefer-dist --no-scripts --optimize-autoloader'
set :composer_roles, :all

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # This task is required by Capistrano but can be a no-op
      # Your restart mechanism here, for example:
      # execute :service, :nginx, :reload
    end
  end

end