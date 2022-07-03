module Queries
  class HistoricalMin < ApplicationService
    def call
      Weather.historical.minimum(:temperature)
    end
  end
end