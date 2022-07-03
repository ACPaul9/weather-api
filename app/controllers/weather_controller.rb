class WeatherController < ApplicationController
  def current
    weather = Weather.current
    render json: {temperature: weather.temperature}
  end

  def min
    temperature = Queries::HistoricalMin.call
    render json: {temperature: temperature}
  end

  def max
    temperature = Queries::HistoricalMax.call
    render json: {temperature: temperature}
  end

  def avg
    temperature = Queries::HistoricalAvg.call
    render json: {temperature: temperature}
  end
end