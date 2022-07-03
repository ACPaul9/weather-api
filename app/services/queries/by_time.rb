module Queries
  class ByTime < ApplicationService
    ALLOWED_INTERVAL = 3.hours.to_i
    private_constant :ALLOWED_INTERVAL

    def initialize(timestamp)
      @timestamp = timestamp
    end

    def call
      return unless timestamp
      return unless timestamp.match?(/\A\d+\z/)

      previous_weather =
        Weather.where("observation_time <= ?", Time.at(timestamp.to_i))
               .order(observation_time: :desc).first

      next_weather =
        Weather.where("observation_time >= ?", Time.at(timestamp.to_i))
               .order(observation_time: :asc).first

      closest_weather =
        [previous_weather, next_weather]
          .compact
          .sort_by { |weather| (weather.observation_time.to_i - timestamp.to_i).abs }
          .select { |weather| (weather.observation_time.to_i - timestamp.to_i).abs <= ALLOWED_INTERVAL }
          .first

      return unless closest_weather

      closest_weather.temperature
    end

    private

    attr_reader :timestamp

  end
end