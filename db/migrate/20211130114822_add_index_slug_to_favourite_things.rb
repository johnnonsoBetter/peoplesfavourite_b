class AddIndexSlugToFavouriteThings < ActiveRecord::Migration[6.0]
  def change
    add_index :favourite_things, :slug
    #Ex:- add_index("admin_users", "username")
  end
end
