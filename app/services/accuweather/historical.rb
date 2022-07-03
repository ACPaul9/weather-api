module Accuweather
  class Historical < ApplicationService
    def call
      parsed_response.map do |forecast|
        {
          temperature: forecast.dig("Temperature", "Metric", "Value").to_d,
          observation_time: Time.at(forecast["EpochTime"]),
        }
      end
    end

    private

    def historical_url
      "#{BASE_URL}/currentconditions/v1/#{LOCATION_KEY}/historical/24"
    end

    def parsed_response
      @parsed_response ||= HTTParty.get(historical_url, query: {apikey: API_KEY})
    end
  end
end
