require 'rubygems'
require 'bundler/setup'

require "pry"
require "active_record"
require "sqlite3"
require "sinatra"
require "sinatra/reloader"
require 'bcrypt'



set :sessions, true

require_relative "database_setup.rb"

# Controllers
require_relative "controllers/main.rb"

# Models
require_relative "models/photographer.rb"
require_relative "models/album.rb"
require_relative "models/photo.rb"