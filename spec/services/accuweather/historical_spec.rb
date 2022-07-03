require 'rails_helper'

RSpec.describe Accuweather::Historical do
  describe ".call" do
    subject { described_class.call }

    let(:expected_result) do
      [
        {observation_time: Time.at(1656860220), temperature: 28.3.to_d},
        {observation_time: Time.at(1656857040), temperature: 28.3.to_d},
        {observation_time: Time.at(1656853380), temperature: 29.1.to_d},
        {observation_time: Time.at(1656849420), temperature: 28.0.to_d},
        {observation_time: Time.at(1656846240), temperature: 28.0.to_d},
        {observation_time: Time.at(1656842220), temperature: 26.6.to_d},
        {observation_time: Time.at(1656839040), temperature: 26.6.to_d},
        {observation_time: Time.at(1656835440), temperature: 25.0.to_d},
        {observation_time: Time.at(1656831420), temperature: 21.8.to_d},
        {observation_time: Time.at(1656827820), temperature: 20.0.to_d},
        {observation_time: Time.at(1656824280), temperature: 17.6.to_d},
        {observation_time: Time.at(1656820620), temperature: 15.6.to_d},
        {observation_time: Time.at(1656817380), temperature: 15.6.to_d},
        {observation_time: Time.at(1656813780), temperature: 14.4.to_d},
        {observation_time: Time.at(1656809820), temperature: 14.4.to_d},
        {observation_time: Time.at(1656806700), temperature: 14.4.to_d},
        {observation_time: Time.at(1656802620), temperature: 15.2.to_d},
        {observation_time: Time.at(1656799080), temperature: 15.5.to_d},
        {observation_time: Time.at(1656795840), temperature: 15.5.to_d},
        {observation_time: Time.at(1656792360), temperature: 16.7.to_d},
        {observation_time: Time.at(1656788640), temperature: 18.2.to_d},
        {observation_time: Time.at(1656784620), temperature: 21.0.to_d},
        {observation_time: Time.at(1656781080), temperature: 22.4.to_d},
        {observation_time: Time.at(1656777420), temperature: 23.7.to_d},
      ]
    end

    it { VCR.use_cassette("accuweather_historical") { is_expected.to eq expected_result } }
  end
end