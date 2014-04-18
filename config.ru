#config.ru
require 'rubygems' 
require 'bundler'  
Bundler.require
require 'sinatra'
require 'rack'
require "#{File.dirname(__FILE__)}/picturama.rb"
run Sinatra::Application