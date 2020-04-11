class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :release_year

      t.timestamps
    end
    add_index :games, :title
    add_index :games, :release_year
  end
end
