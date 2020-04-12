class CreateConsoles < ActiveRecord::Migration[6.0]
  def change
    create_table :consoles do |t|
      t.string :name

      t.timestamps
    end
    add_index :consoles, :name
  end
end
