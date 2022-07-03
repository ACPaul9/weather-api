class CreateWeather < ActiveRecord::Migration[7.0]
  def change
    create_table :weather do |t|
      t.decimal :temperature, precision: 4, scale: 1
      t.timestamp :observation_time

      t.timestamps
    end
  end
end
