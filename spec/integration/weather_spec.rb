require "swagger_helper"

RSpec.describe "Weather API" do
  let!(:weather1) { Weather.create(observation_time: 1.hour.ago, temperature: 22.to_d) }
  let!(:weather2) { Weather.create(observation_time: 2.hours.ago, temperature: 26.to_d) }
  let!(:weather3) { Weather.create(observation_time: 3.hours.ago, temperature: 34.to_d) }
  let!(:weather4) { Weather.create(observation_time: 4.hours.ago, temperature: 14.to_d) }
  let!(:weather5) { Weather.create(observation_time: 5.hours.ago, temperature: 18.to_d) }
  let!(:weather6) { Weather.create(observation_time: 6.hours.ago, temperature: 2.to_d) }
  let!(:weather7) { Weather.create(observation_time: 7.hours.ago, temperature: 6.to_d) }
  let!(:weather8) { Weather.create(observation_time: 8.hours.ago, temperature: 30.to_d) }
  let!(:weather9) { Weather.create(observation_time: 9.hours.ago, temperature: 10.to_d) }

  path "/weather/current" do
    get "return current temperature" do
      response "200", "successful" do
        schema "$ref" => "#/components/schemas/temperature_object"
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body, symbolize_names: true)
          expect(data[:temperature]).to eq "22.0"
        end
      end
    end
  end

  path "/weather/historical/min" do
    get "return lowest temperature for last 24 hours" do
      response "200", "successful" do
        schema '$ref' => '#/components/schemas/temperature_object'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body, symbolize_names: true)
          expect(data[:temperature]).to eq "2.0"
        end
      end
    end
  end

  path "/weather/historical/max" do
    get "return highest temperature for last 24 hours" do
      response "200", "successful" do
        schema '$ref' => '#/components/schemas/temperature_object'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body, symbolize_names: true)
          expect(data[:temperature]).to eq "34.0"
        end
      end
    end
  end

  path "/weather/historical/avg" do
    get "return average temperature for last 24 hours" do
      response "200", "successful" do
        schema '$ref' => '#/components/schemas/temperature_object'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body, symbolize_names: true)
          expect(data[:temperature]).to eq "18.0"
        end
      end
    end
  end

  path "/weather/by_time" do
    get "return temperature closest for timestamp" do
      parameter name: :timestamp, in: :query, type: :integer

      response "200", "successful" do
        let(:timestamp) { 100.minutes.ago.to_i }

        schema '$ref' => '#/components/schemas/temperature_object'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body, symbolize_names: true)
          expect(data[:temperature]).to eq "26.0"
        end
      end

      response "404", "not found" do
        let(:timestamp) { 13.hours.ago.to_i }

        schema '$ref' => '#/components/schemas/error_object'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body, symbolize_names: true)
          expect(data[:temperature]).to be nil
          expect(data[:error]).to be
        end
      end
    end
  end
end