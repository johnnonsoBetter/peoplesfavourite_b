class AddColumnNameToFavouriteThings < ActiveRecord::Migration[6.0]
  def change
    add_column :favourite_things, :name, :string
  end
end
