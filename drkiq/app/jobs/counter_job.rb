class CounterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ENV.fetch("ALPHAVANTAGE_KEY")
  end
end
