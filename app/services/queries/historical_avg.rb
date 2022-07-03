module Queries
  class HistoricalAvg < ApplicationService
    def call
      Weather.historical.average(:temperature).round(1)
    end
  end
end