require 'rubygems'
require 'picturama'
require "rake"
require "rake/testtask"

# Loading picturama gem tasks
picturama = Gem::Specification.find_by_name 'picturama'

Dir["#{picturama.gem_dir}/lib/tasks/*.rake"].each { |task| load task }

# loading UI custom tasks
Dir["lib/tasks/*.rake"].each { |task| load task }