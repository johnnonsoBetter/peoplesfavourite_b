class DropTableFavouriteThingTypes < ActiveRecord::Migration[6.0]
  def change
    drop_table :favourite_thing_types
  end
end
