require "rails_helper"

RSpec.describe AccuweatherCache do
  describe ".call" do
    subject { described_class.call }

    context "when all records are new" do
      it { VCR.use_cassette("accuweather_historical") { expect { subject }.to change(Weather, :count).from(0).to(24) } }
    end

    context "when some records already exists" do
      let!(:weather) { Weather.create(observation_time: Time.at(1656799080), temperature: 15.5.to_d) }

      it { VCR.use_cassette("accuweather_historical") { expect { subject }.to change(Weather, :count).from(1).to(24) } }
    end
  end
end