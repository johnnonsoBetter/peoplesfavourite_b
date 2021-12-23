class AddSlugToThings < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :slug, :string
    add_index :things, :slug, unique: true
  end
end
