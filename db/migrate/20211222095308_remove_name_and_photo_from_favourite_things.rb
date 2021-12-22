class RemoveNameAndPhotoFromFavouriteThings < ActiveRecord::Migration[6.0]
  def change
    remove_column :favourite_things, :name 
    remove_column :favourite_things, :photo
  end
end
