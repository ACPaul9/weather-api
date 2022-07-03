class AccuweatherCache < ApplicationService
  def call
    data = Accuweather::Historical.call

    ActiveRecord::Base.transaction do
      data.each do |forecast|
        Weather.find_or_initialize_by(observation_time: forecast[:observation_time])
               .update(temperature: forecast[:temperature])
      end
    end
  end
end