module Queries
  class HistoricalMax < ApplicationService
    def call
      Weather.historical.maximum(:temperature)
    end
  end
end