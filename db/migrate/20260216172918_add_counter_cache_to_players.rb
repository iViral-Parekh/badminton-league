class AddCounterCacheToPlayers < ActiveRecord::Migration[8.1]
  def change
    add_column :players, :wins_count, :integer, default: 0
    add_column :players, :losses_count, :integer, default: 0
  end
end
