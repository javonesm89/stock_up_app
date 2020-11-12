stocks = "https://cloud.iexapis.com/stable/stock/market/batch?symbols=aapl,msft,f,jpm,bby,atv,ulta,nke,dis,uber,addy,dltr&types=quote&range=1m&last=5&token=pk_6935431c59194b9ba04fa9ac5b43471c"
response = HTTParty.get(stocks)
	
response.each do |name,v|
	v.each do |quote,v|
        Stock.create(name: v["companyName"],symbol: v["symbol"],price: v["iexClose"])
	end
end


