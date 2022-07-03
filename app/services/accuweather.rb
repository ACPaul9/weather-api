module Accuweather
  LOCATION_KEY = 293006
  BASE_URL = "https://dataservice.accuweather.com"
  API_KEY = ENV.fetch("ACCUWEATHER_API_KEY")
  private_constant :LOCATION_KEY
  private_constant :BASE_URL
  private_constant :API_KEY
end