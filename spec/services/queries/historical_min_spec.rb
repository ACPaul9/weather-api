require "rails_helper"

RSpec.describe Queries::HistoricalMin do
  describe ".call" do
    subject { described_class.call }

    let!(:weather1) { Weather.create(observation_time: 1.hour.ago, temperature: 22.to_d) }
    let!(:weather2) { Weather.create(observation_time: 2.hour.ago, temperature: 26.to_d) }
    let!(:weather3) { Weather.create(observation_time: 3.hour.ago, temperature: 34.to_d) }
    let!(:weather4) { Weather.create(observation_time: 4.hour.ago, temperature: 14.to_d) }
    let!(:weather5) { Weather.create(observation_time: 5.hour.ago, temperature: 18.to_d) }
    let!(:weather6) { Weather.create(observation_time: 6.hour.ago, temperature: 2.to_d) }
    let!(:weather7) { Weather.create(observation_time: 7.hour.ago, temperature: 6.to_d) }
    let!(:weather8) { Weather.create(observation_time: 8.hour.ago, temperature: 30.to_d) }
    let!(:weather9) { Weather.create(observation_time: 9.hour.ago, temperature: 10.to_d) }

    it { is_expected.to eq 2 }
  end
end