require "rails_helper"

RSpec.describe Queries::ByTime do
  describe ".call" do
    subject { described_class.call(timestamp) }

    let!(:weather1) { Weather.create(observation_time: 1.hour.ago, temperature: 22.to_d) }
    let!(:weather2) { Weather.create(observation_time: 2.hours.ago, temperature: 26.to_d) }
    let!(:weather3) { Weather.create(observation_time: 3.hours.ago, temperature: 34.to_d) }
    let!(:weather4) { Weather.create(observation_time: 4.hours.ago, temperature: 14.to_d) }
    let!(:weather5) { Weather.create(observation_time: 5.hours.ago, temperature: 18.to_d) }
    let!(:weather6) { Weather.create(observation_time: 6.hours.ago, temperature: 2.to_d) }
    let!(:weather7) { Weather.create(observation_time: 7.hours.ago, temperature: 6.to_d) }
    let!(:weather8) { Weather.create(observation_time: 8.hours.ago, temperature: 30.to_d) }
    let!(:weather9) { Weather.create(observation_time: 9.hours.ago, temperature: 10.to_d) }

    context "when timestamp is invalid" do
      let(:timestamp) { "test" }

      it { is_expected.to be nil }
    end

    context "when timestamp is nil" do
      let(:timestamp) { nil }

      it { is_expected.to be nil }
    end

    context "when timestamp more than 3 hours earlier first record" do
      let(:timestamp) { 13.hours.ago.strftime("%s") }

      it { is_expected.to be nil }
    end

    context "when timestamp less than 3 hours earlier first record" do
      let(:timestamp) { 11.hours.ago.strftime("%s") }

      it { is_expected.to eq 10 }
    end

    context "when timestamp is closer to previous weather" do
      let(:timestamp) { 110.minutes.ago.strftime("%s") }

      it { is_expected.to eq 26 }
    end

    context "when timestamp is closer to next weather" do
      let(:timestamp) { 80.minutes.ago.strftime("%s") }

      it { is_expected.to eq 22 }
    end

    context "when timestamp less than 3 hours after last record" do
      let(:timestamp) { 2.hours.from_now.strftime("%s") }

      it { is_expected.to eq 22 }
    end

    context "when timestamp more than 3 hours after last record" do
      let(:timestamp) { 4.hours.from_now.strftime("%s") }

      it { is_expected.to be nil }
    end
  end
end