class AddIndexSlugToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :slug, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
