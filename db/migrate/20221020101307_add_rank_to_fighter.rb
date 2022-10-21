class AddRankToFighter < ActiveRecord::Migration[7.0]
  def change
    add_column :fighters, :rank, :integer
  end
end
