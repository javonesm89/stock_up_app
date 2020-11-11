# require 'rubygems' to application is aware of them
require 'rubygems'
# require 'bundler' to load all dependencies(gems)
require 'bundler'

Bundler.require(:default)

ActiveRecord::Base.establish_connection(
	  	:adapter => "sqlite3",
	  	:database => "db/stock_up.sqlite"
)
	
require_all 'app'
