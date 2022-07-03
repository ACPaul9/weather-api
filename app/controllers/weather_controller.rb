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

  def by_time
    temperature = Queries::ByTime.call(params[:timestamp])

    if temperature
      render json: {temperature: temperature}
    else
      render json: {error: 'not found'}, status: :not_found
    end
  end
end