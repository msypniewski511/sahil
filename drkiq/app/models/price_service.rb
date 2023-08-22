# require 'byebug'
class PriceService
  def self.fetch_prices(ticker)
    # stocks_found = client.search keywords: ticker
    # timeseries = Alphavantage::Timeseries.new symbol: ticker, key: ENV.fetch("ALPHAVANTAGE_KEY")
    timeseries = client
      .stock(symbol: ticker)
      .timeseries(adjusted: true, outputsize: 'full')
      .output['Time Series (Daily)']
      .map {|k, v| [k, v["5. adjusted close"]]}
    # byebug
    # 1 + 1
    # stocks_found.output # Return the hash retrieved
    Hash[timeseries]
  end

  def self.client
    @client ||= Alphavantage::Client.new key: ENV.fetch("ALPHAVANTAGE_KEY")
  end
end