class Weather < ApplicationRecord
  self.table_name = "weather"

  scope :ordered, -> { order(observation_time: :desc) }
  scope :current, -> { ordered.first }
  scope :historical, -> { ordered.limit(24) }
end
