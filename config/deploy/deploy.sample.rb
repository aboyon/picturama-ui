require 'capistrano/ext/multistage'

config = YAML.load_file('config/config.yml')['picturama']['capistrano']

set :port, config['port']
set :application, config['app_name']
set :scm, :git
set :stages, config['stages']
set :default_stage, config['stages'][0]
set :deploy_to, config['deploy_to']
set :repository, config['repository']
set :user, config['user']