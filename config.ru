require 'rubygems'
require 'bundler'

Bundler.require(:default, ENV['RACK_ENV'])

require './application'
use Ironhack::Application
run Sinatra::Application
