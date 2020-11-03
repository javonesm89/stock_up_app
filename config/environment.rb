# require 'rubygems' to application is aware of them
require 'rubygems'
# require 'bundler' to load all dependencies(gems)
require 'bundler'

Bundler.require(:default)

ActiveRecord::Base.establish_connection(
	  	:adapter => "sqlite3",
	  	:database => "db/stock_up.sqlite"
)
	
# require 'httparty'

# response = HTTParty.get("https://cloud.iexapis.com/stable/stock/market/batch?symbols=aapl,msft,tsla,ulta,amzn,nke,dis,uber,addy,dltr&types=quote&range=1m&last=5&token=pk_6935431c59194b9ba04fa9ac5b43471c")

	
	
	# Stock.create(
		# name: v["companyName"],
		# symbol: v["symbol"],
		# price: v["iexClose"],

	# )
	
	
require_all 'app'
