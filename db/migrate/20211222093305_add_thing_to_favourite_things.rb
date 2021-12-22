class AddThingToFavouriteThings < ActiveRecord::Migration[6.0]
  def change
    add_reference :favourite_things, :thing, null: true, foreign_key: true
  end
end
