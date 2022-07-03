# frozen_string_literal: true

class RunAccuweatherCache < ActiveRecord::Migration[7.0]
  def up
    AccuweatherCache.call
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
