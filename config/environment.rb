# require 'rubygems' to application is aware of them
require 'rubygems'
# require 'bundler' to load all dependencies(gems)
require 'bundler'

Bundler.require(:default)

ActiveRecord::Base.establish_connection(
	  	:adapter => "sqlite3",
	  	:database => "db/stock_up.sqlite"
	)
	
	# response = HTTParty.get("https://sandbox.iexapis.com/stable/stock/TSLA/quote?token=Tpk_a893d49b04864abcaa87a3b1668bd627")
	# puts response["symbol"]
	# puts response["latestPrice"]
	
	
require_all 'app'
