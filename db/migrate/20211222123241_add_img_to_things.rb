class AddImgToThings < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :img, :string
  end
end
