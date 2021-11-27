class AddPhotoToFavouriteThingType < ActiveRecord::Migration[6.0]
  def change
    add_column :favourite_thing_types, :photo, :string
   
  end
end
