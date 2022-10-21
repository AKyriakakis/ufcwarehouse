class AddWeightClassToFighter < ActiveRecord::Migration[7.0]
  def change
    add_column :fighters, :weightclass, :string
  end
end
