class AddCreatedAtIndexToMatches < ActiveRecord::Migration[8.1]
  def change
    add_index :matches, :created_at
  end
end
